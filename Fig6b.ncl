load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/shea_util.ncl"

begin
yval = new((/10,5/),"float",-999.)

yval(0,0) = 317.58 
yval(0,1) = 426.36 
yval(0,2) = 516.92 
yval(0,3) = 620.45 
yval(0,4) = 810.99 

yval(1,0) = 316.19 
yval(1,1) = 422.25 
yval(1,2) = 516.47 
yval(1,3) = 623.14 
yval(1,4) = 817.81 

yval(2,0) = 412.04 
yval(2,1) = 572.47 
yval(2,2) = 707.74 
yval(2,3) = 874.71 
yval(2,4) = 1166.39 

yval(3,0) = 653.77 
yval(3,1) = 964.34 
yval(3,2) = 1247.66 
yval(3,3) = 1638.01 
yval(3,4) = 2416.65 

yval(4,0) = 490.60 
yval(4,1) = 679.54 
yval(4,2) = 856.68 
yval(4,3) = 1083.36 
yval(4,4) = 1504.47 

yval(5,0) = 518.78 
yval(5,1) = 740.31 
yval(5,2) = 945.99 
yval(5,3) = 1199.79 
yval(5,4) = 1667.09 

yval(6,0) = 407.56 
yval(6,1) = 548.53 
yval(6,2) = 669.27 
yval(6,3) = 812.08 
yval(6,4) = 1062.92 

yval(7,0) = 554.61 
yval(7,1) = 764.49 
yval(7,2) = 951.51 
yval(7,3) = 1179.53 
yval(7,4) = 1604.88 

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
wks = gsn_open_wks(type,"Fig4c")               ; send graphics to PNG file
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
mean=(/533.50,534.61,738.89,1357.11,908.16,999.74,693.69,998.56,641.07,701.29/)

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