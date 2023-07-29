load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/shea_util.ncl"
begin


line_thick_SSP119 = (/1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,3/)
line_thick_SSP126 = (/1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,3/)
line_thick_SSP245 = (/1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,3/)
line_thick_SSP370 = (/1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,3/)
line_thick_SSP585 = (/1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,3/)
line_thick_SSP534 = (/1,1,1,1,1,1,1,1,1,1,1,1,1,3/)
line_thick_SSP434 = (/1,1,1,1,1,1,1,1,1,1,3/)
line_thick_SSP460 = (/1,1,1,1,1,1,1,1,1,3/)
line_thick_G6solar = (/1,1,1,1,1,1,1,1,1,1,1,1,1,3/)
line_thick_G6sulfur = (/1,1,1,1,1,1,1,1,1,1,1,1,1,3/)



line_color_SSP119 = (/23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,5/)
line_color_SSP126 = (/23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,11/)
line_color_SSP245 = (/23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,10/)
line_color_SSP370 = (/23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,6/)
line_color_SSP585 = (/23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,14/)
line_color_SSP534 = (/23,23,23,23,23,23,23,23,23,23,23,23,23,15/)
line_color_SSP434 = (/23,23,23,23,23,23,23,23,23,23,17/)
line_color_SSP460 = (/23,23,23,23,23,23,23,23,23,16/)
line_color_G6solar = (/23,23,23,23,23,23,23,23,23,23,23,23,23,25/)
line_color_G6sulfur = (/23,23,23,23,23,23,23,23,23,23,23,23,23,26/)



;----------------------------------------------------------
wks  = gsn_open_wks("PDF","Tas_line")
plot = new(10,graphic)
gsn_define_colormap(wks,"cyt")

res                      = True
res@vpWidthF          = 0.5
res@vpHeightF         = 0.2

res@gsnDraw              = False                ; Don't draw plot 
res@gsnFrame             = False                ; Don't advance frame
res@xyDashPatterns    = 0   


res@tmXBMinorOn          = False                ; Turn off x-axis (bottom) minor ticks
res@tmXTMinorOn          = False                ; Turn off x-axis (bottom)minor ticks
res@tmXTOn               = True                ; Turn off x-axis (top) major ticks
res@tmYRMinorOn          = False                ; Turn off y-axis (right) minor ticks
res@tmYLMinorOn          = False                ; Turn off y-axis (left) minor ticks
res@tmXBMode             = "Explicit"
res@tmYLLabelFont   = "times-roman"
res@tiYAxisFont     = "times-roman"
res@tiMainFont            = "times-roman"


x   =   ispan(2015,2100,1)
res@tmXBValues           = (/2015,2020,2025,2030,2035,2040,2045,2050,2055,2060,2065,2070,2075,2080,2085,2090,2095,2100/)
res@tmXBLabels           = (/"","2020","","2030","","2040","","2050","","2060","","2070","","2080","","2090","","2100"/)
res@trXMinF               = 2015
res@trXMaxF               = 2100



res@tiYAxisString        = ""        ; Y-axis title
res@tmXBLabelFontHeightF = 0.018                ; Label font height (X0.020 for scaling)
res@tmYLLabelFontHeightF = 0.020                ; Label font height (X0.020 for scaling)


;朝里
res@tmYLMajorOutwardLengthF = -0.00
res@tmYLMinorOutwardLengthF = -0.00
res@tmXBMajorOutwardLengthF = -0.00
res@tmXBMinorOutwardLengthF = -0.00

res@tmXBMajorLengthF  = 0.0075	            ; set tickmarks 
res@tmXTMajorLengthF  = 0.0075	            ; set tickmarks 
res@tmYLMajorLengthF  = 0.0075         	; set tickmarks 
res@tmYRMajorLengthF  = 0.0075         	; set tickmarks 
res@tmBorderThicknessF  = 1.2
res@tmXBMajorThicknessF = 1.2	            ; set tickmarks 
res@tmYLMajorThicknessF = 1.2         	; set tickmarks 


;read nc file
f1 = addfile ("I:/Fig1_data/SSP119.nc", "r")
f2 = addfile ("I:/Fig1_data/SSP126.nc", "r")
f3 = addfile ("I:/Fig1_data/SSP245.nc", "r")
f4 = addfile ("I:/Fig1_data/SSP370.nc", "r")
f5 = addfile ("I:/Fig1_data/SSP434.nc", "r")
f6 = addfile ("I:/Fig1_data/SSP460.nc", "r")
f7 = addfile ("I:/Fig1_data/SSP534-over.nc", "r")
f8 = addfile ("I:/Fig1_data/SSP585.nc", "r")
f9 = addfile ("I:/Fig1_data/G6solar.nc", "r")
f10 = addfile ("I:/Fig1_data/G6sulfur.nc", "r")

ssp119 = f1->data
ssp126 = f2->data
ssp126(29,:) = f2->data@_FillValue
ssp245 = f3->data
ssp370 = f4->data
ssp434 = f5->data
ssp460 = f6->data
ssp534 = f7->data
ssp585 = f8->data
G6solar = f9->data
G6sulfur = f10->data


res@tmYLMode             = "Manual"
res@tmYLTickStartF = 0
res@tmYLTickEndF = 2.0
res@tmYLTickSpacingF = 0.5
res@tmYLLabelStride = 2
res@tmYLAutoPrecision = False
res@tmYLPrecision = 1
res@trYMinF               = -0.5
res@trYMaxF               = 2.0
res@tmXBLabelAngleF = 90.
res@xyLineColors         = line_color_SSP119
res@xyLineThicknesses    = line_thick_SSP119           ; Plot line thickness
plot(0) = gsn_csm_xy(wks,x,ssp119,res)

delete(res@xyLineColors)
delete(res@xyLineThicknesses)
res@xyLineColors         = line_color_SSP126
res@xyLineThicknesses    = line_thick_SSP126           ; Plot line thickness
plot(5) = gsn_csm_xy(wks,x,ssp126,res)


res@tmYLMode             = "Manual"
res@tmYLTickStartF = 0
res@tmYLTickEndF = 4
res@tmYLTickSpacingF = 1
res@tmYLLabelStride = 2
res@tmYLAutoPrecision = False
res@tmYLPrecision = 1
res@trYMinF               = -0.5
res@trYMaxF               = 4.5

delete(res@xyLineColors)
delete(res@xyLineThicknesses)
res@xyLineColors         = line_color_SSP245
res@xyLineThicknesses    = line_thick_SSP245           ; Plot line thickness
plot(1) = gsn_csm_xy(wks,x,ssp245,res)

delete(res@xyLineColors)
delete(res@xyLineThicknesses)
res@xyLineColors         = line_color_SSP460
res@xyLineThicknesses    = line_thick_SSP460           ; Plot line thickness
plot(6) = gsn_csm_xy(wks,x,ssp460,res)


res@tmYLMode             = "Manual"
res@tmYLTickStartF = 0
res@tmYLTickEndF = 2.5
res@tmYLTickSpacingF = 0.5
res@tmYLLabelStride = 2
res@tmYLAutoPrecision = False
res@tmYLPrecision = 1
res@trYMinF               = -0.5
res@trYMaxF               = 2.8

delete(res@xyLineColors)
delete(res@xyLineThicknesses)
res@xyLineColors         = line_color_SSP434
res@xyLineThicknesses    = line_thick_SSP434           ; Plot line thickness
plot(2) = gsn_csm_xy(wks,x,ssp434,res)

delete(res@xyLineColors)
delete(res@xyLineThicknesses)
res@xyLineColors         = line_color_SSP534
res@xyLineThicknesses    = line_thick_SSP534           ; Plot line thickness
plot(7) = gsn_csm_xy(wks,x,ssp534,res)


res@tmYLMode             = "Manual"
res@tmYLTickStartF = 0
res@tmYLTickEndF = 7
res@tmYLTickSpacingF = 1
res@tmYLLabelStride = 3
res@tmYLAutoPrecision = False
res@tmYLPrecision = 1
res@trYMinF               = -0.5
res@trYMaxF               = 7.5

delete(res@xyLineColors)
delete(res@xyLineThicknesses)
res@xyLineColors         = line_color_SSP370
res@xyLineThicknesses    = line_thick_SSP370           ; Plot line thickness
plot(3) = gsn_csm_xy(wks,x,ssp370,res)

delete(res@xyLineColors)
delete(res@xyLineThicknesses)
res@xyLineColors         = line_color_SSP585
res@xyLineThicknesses    = line_thick_SSP585           ; Plot line thickness
plot(8) = gsn_csm_xy(wks,x,ssp585,res)


res@tmYLMode             = "Manual"
res@tmYLTickStartF = 0
res@tmYLTickEndF = 4
res@tmYLTickSpacingF = 1
res@tmYLLabelStride = 2
res@tmYLAutoPrecision = False
res@tmYLPrecision = 1
res@trYMinF               = -0.5
res@trYMaxF               = 4.5

delete(res@xyLineColors)
delete(res@xyLineThicknesses)
res@xyLineColors         = line_color_G6solar
res@xyLineThicknesses    = line_thick_G6solar           ; Plot line thickness
plot(4) = gsn_csm_xy(wks,x,G6solar,res)

delete(res@xyLineColors)
delete(res@xyLineThicknesses)
res@xyLineColors         = line_color_G6sulfur
res@xyLineThicknesses    = line_thick_G6sulfur           ; Plot line thickness
plot(9) = gsn_csm_xy(wks,x,G6sulfur,res)



res1             = True
res2             = True
res1@gsnMaximize = True
res2@gsnAttachPlotsXAxis = True

anno1 = gsn_attach_plots(plot(0),plot(1:4),res1,res2)
draw(plot(0))

;anno1 = gsn_attach_plots(plot(5),plot(6:9),res1,res2)
;draw(plot(5))


frame(wks)

end