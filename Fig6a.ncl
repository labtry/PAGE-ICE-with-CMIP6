load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/shea_util.ncl"

begin
yval = new((/10,5/),"float",-999.)

yval(0,0) = 179.79 
yval(0,1) = 257.70 
yval(0,2) = 324.84 
yval(0,3) = 402.80 
yval(0,4) = 555.57 

yval(1,0) = 237.94 
yval(1,1) = 330.27 
yval(1,2) = 412.49 
yval(1,3) = 509.53 
yval(1,4) = 688.37 

yval(2,0) = 386.86 
yval(2,1) = 542.46 
yval(2,2) = 673.75 
yval(2,3) = 833.74 
yval(2,4) = 1114.85 

yval(3,0) = 650.51 
yval(3,1) = 958.01 
yval(3,2) = 1237.23 
yval(3,3) = 1626.58 
yval(3,4) = 2401.55 

yval(4,0) = 385.96 
yval(4,1) = 549.96 
yval(4,2) = 701.34 
yval(4,3) = 896.29 
yval(4,4) = 1261.28 

yval(5,0) = 494.50 
yval(5,1) = 707.52 
yval(5,2) = 907.63 
yval(5,3) = 1155.93 
yval(5,4) = 1604.38 

yval(6,0) = 345.48 
yval(6,1) = 479.37 
yval(6,2) = 593.27 
yval(6,3) = 727.12 
yval(6,4) = 959.61 

yval(7,0) = 553.45 
yval(7,1) = 763.32 
yval(7,2) = 950.06 
yval(7,3) = 1178.10 
yval(7,4) = 1602.95  

yval(8,0) = 350.45 
yval(8,1) = 489.90 
yval(8,2) = 614.68 
yval(8,3) = 759.62 
yval(8,4) = 1021.81 

yval(9,0) = 389.61 
yval(9,1) = 544.06 
yval(9,2) = 674.53 
yval(9,3) = 828.76 
yval(9,4) = 1113.48 

x = (/-4,-3.5,-2.5,-1.5,-0.5,0,1,1.5,2.5,3/)

type="PDF"
type@wkPaperWidthF  = 7.5
type@wkPaperHeightF = 12.0
wks = gsn_open_wks(type,"Fig4a")               ; send graphics to PNG file
gsn_define_colormap(wks,"cyt")



res            = True                         ; plot mods desired

;res@gsnMaximize        = True         ; Maximize plot in frame

res@vpXF = 0     ;左边距
res@vpYF = 0.95      ;上边距
res@vpHeightF=  0.9               ; change aspect ratio of plot
res@vpWidthF = 0.6

res@tiMainString = ""
res@tiYAxisFont     = "times-roman"
res@tiYAxisString   = ""
res@tiYAxisSide     = "Right"

res@tmYROn          = True   
res@tmYLOn          = False   
res@trYMinF         = 0           
res@trYMaxF         = 2500
res@tmYRLabelsOn    = True 

res@tmYUseLeft = False
res@tmYRLabelAngleF = 90.
;res@tmYRLabelDirection = "Across"

res@tmYRLabelFont   = "times-roman"
res@tmYRMode        = "Manual"	   
res@tmYRTickStartF  = 0   
res@tmYRTickEndF    = 2500
res@tmYRLabelStride = 2 
res@tmYRTickSpacingF= 250   


;朝里
res@tmYRMajorOutwardLengthF = -0.00
res@tmYRMinorOutwardLengthF = -0.00
res@tmXBMajorOutwardLengthF = -0.00
res@tmXBMinorOutwardLengthF = -0.00
res@tmYRMajorLengthF = 0.01

res@tmYRMinorOn          = False                ; Turn off y-axis (right) minor ticks
res@tmYLMinorOn          = False                ; Turn off y-axis (left) minor ticks

res@tmXBOn          = True  ;刻度线
res@tmXBMajorLengthF = 0.01
res@tmXTOn          = True  ;刻度线
res@tmXTMajorLengthF = 0.01
res@tmXBLabelsOn    = False  ;标签
;res@tmXBMode             = "Explicit"
;res@tmXBValues           = x
;res@tmXBLabels           = (/"1.9","2.6","4.5","LowNTCF","7.0","3.4","6.0","3.4-OS","8.5"/)


res@tmYRBorderOn    = True          
res@tmXTBorderOn    = True        
res@tmYRLabelFontHeightF = 0.022  



llres                   = True			
llres@gsLineThicknessF  = 2.2                 ; line thickness 

opti          = True			
opti@boxWidth = 0.3				; Width of box (x units)
opti@boxColors = (/5,11,10,6,17,16,15,14,25,26/)

plot = boxplot(wks,x,yval,opti,res,llres)



;添加符号
mres               = True                     ; marker mods desired
mres@gsMarkerIndex = 1                        ; change style
mres@gsMarkerSizeF = 20.                      ; change size
mean=(/339.72,429.95,702.56,1346.64,746.53,960.32,615.15,997.19,641.07,701.29/)

mres@gsMarkerColor = 5
dum1 = gsn_add_polymarker(wks,plot,x(0),mean(0),mres) 
mres@gsMarkerColor = 11
dum2 = gsn_add_polymarker(wks,plot,x(1),mean(1),mres)
mres@gsMarkerColor = 10
dum3 = gsn_add_polymarker(wks,plot,x(2),mean(2),mres) 
mres@gsMarkerColor = 6
dum4 = gsn_add_polymarker(wks,plot,x(3),mean(3),mres)
mres@gsMarkerColor = 17
dum5 = gsn_add_polymarker(wks,plot,x(4),mean(4),mres)
mres@gsMarkerColor = 16
dum6 = gsn_add_polymarker(wks,plot,x(5),mean(5),mres)
mres@gsMarkerColor = 15
dum7 = gsn_add_polymarker(wks,plot,x(6),mean(6),mres)
mres@gsMarkerColor = 14
dum8 = gsn_add_polymarker(wks,plot,x(7),mean(7),mres)
mres@gsMarkerColor = 25
dum9 = gsn_add_polymarker(wks,plot,x(8),mean(8),mres)
mres@gsMarkerColor = 26
dum10= gsn_add_polymarker(wks,plot,x(9),mean(9),mres)


draw(wks)                                    ; boxplot does not call these
frame(wks)                                   ; for you

end