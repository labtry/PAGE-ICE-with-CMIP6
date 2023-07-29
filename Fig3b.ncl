load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/shea_util.ncl"

begin
    
;SSP119,SSP126,SSP245,SSP370,SSP434,SSP460,SSP534,SSP585,G6solar,G6sulfur

y_US=(/(/0.024,0.142,0.301,0.590,1.295/),(/0.053,0.252,0.549,1.011,2.058/),(/0.251,0.746,1.291,2.055,3.659/),(/0.793,1.754,2.725,4.052,6.715/),(/0.114,0.456,0.886,1.488,2.808/),(/0.348,0.973,1.668,2.694,4.807/),(/0.080,0.344,0.694,1.252,2.511/),(/0.859,2.062,3.603,5.996,11.601/),(/0.390,0.941,1.630,2.631,4.929/),(/0.393,0.979,1.719,2.848,5.384/)/)
y_EU=(/(/-0.160,0.061,0.180,0.384,1.077/),(/-0.157,0.109,0.302,0.697,1.579/),(/-0.143,0.250,0.647,1.203,2.396/),(/0.128,0.967,1.708,2.656,4.582/),(/-0.148,0.176,0.489,0.981,1.970/),(/-0.074,0.368,0.832,1.501,3.030/),(/-0.116,0.131,0.382,0.850,1.920/),(/0.332,1.188,2.247,3.904,7.909/),(/0.128,0.561,1.034,1.753,3.321/),(/0.158,0.615,1.128,1.909,3.710/)/)
y_CA=(/(/0.142,0.317,0.516,0.821,1.479/),(/0.182,0.484,0.863,1.383,2.509/),(/0.564,1.112,1.667,2.414,3.741/),(/1.492,2.591,3.591,4.842,7.095/),(/0.448,0.924,1.412,2.029,3.182/),(/0.719,1.511,2.321,3.381,5.437/),(/0.192,0.513,0.917,1.534,2.882/),(/1.358,2.796,4.497,6.976,12.346/),(/0.577,1.174,1.894,2.950,5.105/),(/0.566,1.186,1.921,2.994,5.275/)/)
y_OT=(/(/-0.031,0.117,0.258,0.505,1.139/),(/-0.008,0.223,0.523,0.986,2.026/),(/0.142,0.656,1.193,1.960,3.480/),(/0.749,1.831,2.812,4.105,6.673/),(/0.032,0.400,0.785,1.321,2.402/),(/0.292,0.957,1.626,2.583,4.561/),(/0.014,0.290,0.639,1.194,2.485/),(/0.849,2.129,3.755,6.332,12.346/),(/0.346,0.884,1.557,2.533,4.645/),(/0.324,0.864,1.516,2.488,4.599/)/)
y_AF=(/(/-0.083,0.215,0.446,0.733,1.287/),(/0.008,0.552,1.024,1.613,2.655/),(/1.159,1.861,2.444,3.105,4.202/),(/2.835,4.286,5.757,7.865,12.284/),(/0.983,1.656,2.268,3.020,4.482/),(/2.139,3.256,4.298,5.605,8.035/),(/0.385,0.860,1.336,1.972,3.202/),(/2.442,4.106,5.809,7.948,11.972/),(/0.897,1.646,2.398,3.384,5.235/),(/1.092,1.789,2.474,3.379,5.025/)/)
y_EE=(/(/-0.603,-0.174,0.034,0.221,0.705/),(/-0.705,-0.153,0.114,0.438,1.435/),(/-0.853,-0.093,0.408,1.106,2.647/),(/-0.684,0.580,1.702,3.209,6.899/),(/-0.801,-0.133,0.227,0.731,2.160/),(/-0.864,0.000,0.601,1.480,3.473/),(/-0.645,-0.075,0.159,0.506,1.620/),(/-0.275,1.132,2.811,5.627,12.959/),(/-0.604,0.110,0.665,1.682,4.570/),(/-0.600,0.213,0.945,2.290,6.178/)/)
y_IA=(/(/0.129,0.477,0.779,1.163,1.885/),(/0.202,0.840,1.400,2.099,3.309/),(/1.358,2.123,2.780,3.539,4.820/),(/3.203,4.609,5.887,7.432,10.441/),(/1.344,2.068,2.673,3.356,4.390/),(/2.288,3.260,4.035,4.892,6.346/),(/0.471,1.044,1.638,2.459,4.027/),(/2.487,4.287,6.148,8.558,12.980/),(/1.239,2.154,3.099,4.311,6.554/),(/1.129,1.957,2.854,4.005,6.139/)/)
y_LA=(/(/0.036,0.285,0.507,0.813,1.404/),(/0.056,0.516,0.943,1.503,2.592/),(/0.857,1.500,2.078,2.775,4.050/),(/2.335,3.502,4.474,5.658,7.756/),(/0.780,1.349,1.830,2.397,3.342/),(/1.521,2.351,3.085,3.942,5.441/),(/0.353,0.784,1.258,1.925,3.267/),(/1.774,3.325,5.006,7.299,11.824/),(/0.931,1.655,2.440,3.489,5.493/),(/0.941,1.657,2.467,3.520,5.387/)/)


x = (/-2.25,-1.75,-1.25,-0.75,-0.25,0.25,0.75,1.25,1.75,2.25/)


;**********************************************
; create plot
;**********************************************

type="PDF"
type@wkPaperWidthF  = 4.0
type@wkPaperHeightF = 8.0
wks = gsn_open_wks(type,"Fig2b")               ; send graphics to PNG file
gsn_define_colormap(wks,"cyt")

plot = new(8,graphic)

res            = True                         ; plot mods desired
res@tiMainString = ""
res@gsnMaximize = False
;res@gsnDraw              = False                ; Don't draw plot 
;res@gsnFrame             = False                ; Don't advance frame

;res@vpXF = 0.12     ;左边距
;res@vpYF = 0.95      ;上边距
res@vpHeightF=  0.9               ; change aspect ratio of plot
res@vpWidthF = 0.45    

res@tmYLLabelFont   = "times-roman"
res@tiYAxisFont     = "times-roman"

res@tiYAxisFontHeightF = 0.018
res@tmYLLabelFontHeightF = 0.04   





res@tmXBOn     = False




res@tmYLMajorOutwardLengthF = 0.015
res@tmYLMajorLengthF = 0.015


res@tmYRMinorOn     = False
res@tmYLMinorOn     = False

res@tmXTBorderOn = True
res@tmYRBorderOn = True

res@tmBorderThicknessF  = 0.8
res@tmYLMajorThicknessF  = 0.8

llres                   = True			
llres@gsLineThicknessF  = 0.8                ; line thickness 
llres@gsLineDashPattern = 0
llres@gsLineDashSegLenF =0.001

opti          = True			
opti@boxWidth = 0.25			; Width of box (x units)
opti@boxColors = "black"



res@tmYLMode             = "Manual"
res@tmYLTickStartF = 0
res@tmYLTickEndF = 13
res@tmYLTickSpacingF = 1.5
res@tmYLLabelStride = 2
res@tmYLAutoPrecision = False
res@tmYLPrecision = 2

;res@tiYAxisOffsetXF = 0.2

res@trYMinF               = -1
res@trYMaxF               = 13.2

plot(0) = boxplot(wks,x,y_US,opti,res,llres)
res@tmYLOn     = False
plot(1) = boxplot(wks,x,y_EU,opti,res,llres)
plot(2) = boxplot(wks,x,y_CA,opti,res,llres)
plot(3) = boxplot(wks,x,y_OT,opti,res,llres)
plot(4) = boxplot(wks,x,y_AF,opti,res,llres)	
plot(5) = boxplot(wks,x,y_EE,opti,res,llres)	
plot(6) = boxplot(wks,x,y_IA,opti,res,llres)	
plot(7) = boxplot(wks,x,y_LA,opti,res,llres)	


;添加均值
mres               = True                     ; marker mods desired
mres@gsMarkerIndex = 1                        ; change style
mres@gsMarkerSizeF = 0.007                      ; change size
mean = (/(/0.432,0.733,1.529,3.113,1.095,2.015,0.916,4.575,2.011,2.152/),(/0.279,0.469,0.822,1.942,0.654,1.069,0.580,2.938,1.289,1.427/),(/0.626,1.037,1.849,3.862,1.559,2.606,1.146,5.368,2.251,2.290/),(/0.365,0.697,1.426,3.160,0.943,1.930,0.863,4.809,1.896,1.866/),(/0.503,1.140,2.529,6.425,2.432,4.602,1.504,6.319,2.644,2.690/),(/0.035,0.205,0.597,2.207,0.398,0.883,0.293,4.096,1.172,1.634/),(/0.865,1.534,2.891,6.217,2.749,4.141,1.866,6.732,3.389,3.132/),(/0.587,1.085,2.216,4.680,1.922,3.230,1.460,5.670,2.726,2.722/)/)
;mres@gsMarkerColor = opti@boxColors
dum1 = gsn_add_polymarker(wks,plot(0),x,mean(0,:),mres)
dum2 = gsn_add_polymarker(wks,plot(1),x,mean(1,:),mres)
dum3 = gsn_add_polymarker(wks,plot(2),x,mean(2,:),mres) 
dum4 = gsn_add_polymarker(wks,plot(3),x,mean(3,:),mres)
dum5 = gsn_add_polymarker(wks,plot(4),x,mean(4,:),mres)
dum6 = gsn_add_polymarker(wks,plot(5),x,mean(5,:),mres)
dum7 = gsn_add_polymarker(wks,plot(6),x,mean(6,:),mres)
dum8 = gsn_add_polymarker(wks,plot(7),x,mean(7,:),mres)

; Make panel plot       
resP             = True
resP@gsnMaximize = True
resP@gsnBoxMargin = 0.0
resP@gsnPanelYWhiteSpacePercent = 0.0
resP@gsnPanelXWhiteSpacePercent = 0.0
resP@gsnPanelRowSpec = True
gsn_panel(wks,plot,(/8/),resP)


;draw(wks)                                    ; boxplot does not call these
;frame(wks)                                   ; for you

end