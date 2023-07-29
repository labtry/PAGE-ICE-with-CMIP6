load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/shea_util.ncl"
begin


line_thick = (/0.01,3,0.01/)

wks  = gsn_open_wks("PDF","Fig2a")

gsn_define_colormap(wks,"cyt")

res                      = True
res@gsnDraw              = False                ; Don't draw plot 
res@gsnFrame             = False                ; Don't advance frame   
res@xyLineThicknesses    = line_thick           ; Plot line thickness
res@xyDashPatterns    = (/0,0,0/)  
res@vpHeightF= 0.75                    ; change aspect ratio of plot
res@vpWidthF = 0.9                  
res@tmXBMinorOn          = False                ; Turn off x-axis (bottom) minor ticks
res@tmXTMinorOn          = False                ; Turn off x-axis (bottom)minor ticks
res@tmXTOn               = False                ; Turn off x-axis (top) major ticks
res@tmYRMinorOn          = False                ; Turn off y-axis (right) minor ticks
res@tmYLMinorOn          = False                ; Turn off y-axis (left) minor ticks
res@tmXBMode             = "Explicit"
res@tmYLLabelFont   = "times-roman"
res@tiYAxisFont     = "times-roman"
res@tiMainFont            = "times-roman"


x   =   (/2020,2030,2040,2050,2060,2070,2080,2090,2100/)
res@tmXBValues           = (/2020,2030,2040,2050,2060,2070,2080,2090,2100/)
res@tmXBLabels           = (/"2020","","2040","","2060","","2080","","2100"/)




res@tiYAxisString        = "trillion USD / yr"        ; Y-axis title
res@tiYAxisFontHeightF   = 0.04               ; Y-axis string size (X0.025 for scaling)
res@tiMainFontHeightF    = 0.042               ; Title string size (X0.025 for scaling)
res@tmXBLabelFontHeightF = 0.029                ; Label font height (X0.020 for scaling)
res@tmYLLabelFontHeightF = 0.029                ; Label font height (X0.020 for scaling)


;朝里
res@tmYLMajorOutwardLengthF = -0.00
res@tmYLMinorOutwardLengthF = -0.00
res@tmXBMajorOutwardLengthF = -0.00
res@tmXBMinorOutwardLengthF = -0.00

res@tmXBMajorLengthF  = 0.015	            ; set tickmarks 
res@tmYLMajorLengthF  = 0.015         	; set tickmarks 
res@tmYRMajorLengthF  = 0.015         	; set tickmarks 


res@tmBorderThicknessF  = 1.0
res@tmXBMajorThicknessF = 1.0	            ; set tickmarks 
res@tmYLMajorThicknessF = 1.0         	; set tickmarks 


;5-line

var1=(/(/87.57,281.62,400.41,422.24,376.99,315.20,281.40,222.13,184.55/),(/241.14,475.68,649.19,661.67,594.24,536.58,488.10,403.37,359.93/),(/382.78,657.28,861.22,867.61,781.10,726.56,671.99,568.56,526.02/),(/589.94,894.23,1120.86,1106.95,1005.87,957.62,902.12,798.51,747.69/),(/1098.65,1400.38,1618.90,1543.44,1436.18,1450.53,1366.85,1281.99,1244.16/),(/457.35,722.57,914.31,910.87,825.17,778.02,728.66,636.31,593.80/)/)
var2=(/(/103.51,276.22,433.34,526.59,543.49,525.58,485.99,423.82,381.76/),(/255.38,482.30,669.32,796.44,829.26,824.47,809.13,758.62,710.21/),(/396.97,665.66,873.18,1028.64,1079.68,1075.98,1088.70,1056.14,1048.47/),(/606.23,907.06,1126.91,1304.03,1365.21,1398.28,1436.57,1430.37,1451.20/),(/1096.61,1407.23,1607.30,1780.44,1876.37,1931.56,2036.70,2105.47,2168.80/),(/471.22,730.52,925.82,1077.09,1124.82,1137.16,1156.55,1135.45,1129.23/)/)
var3=(/(/115.19,281.23,462.68,702.47,894.27,1067.07,1194.97,1248.92,1261.01/),(/276.45,480.48,725.72,1042.88,1278.95,1481.06,1654.06,1760.99,1791.43/),(/424.64,669.57,963.37,1334.65,1599.96,1836.85,2043.10,2201.81,2259.47/),(/652.54,924.74,1258.37,1668.61,1971.60,2220.17,2471.99,2674.84,2792.10/),(/1188.14,1478.58,1870.41,2297.24,2608.71,2872.14,3125.82,3440.78,3640.49/),(/508.62,747.64,1033.94,1395.82,1654.87,1881.22,2086.66,2252.34,2329.94/)/)
var4=(/(/126.03,314.89,520.52,812.03,1177.79,1576.46,2051.13,2663.90,3185.76/),(/277.14,532.18,818.44,1217.42,1705.93,2245.42,2877.96,3641.97,4344.97/),(/424.35,750.11,1092.45,1598.94,2232.50,2862.96,3624.36,4540.15,5330.95/),(/641.79,1046.04,1489.41,2134.70,2907.33,3694.41,4622.82,5695.54,6603.93/),(/1181.22,1700.84,2278.64,3174.27,4266.40,5296.97,6475.80,7869.78,9122.05/),(/506.98,845.24,1212.07,1750.87,2409.21,3080.63,3870.51,4808.10,5627.87/)/)
var5=(/(/140.05,345.93,545.00,752.60,907.67,1053.53,1164.28,1210.11,1218.25/),(/287.85,562.37,831.86,1101.42,1312.20,1493.02,1656.51,1721.49,1737.18/),(/430.84,779.87,1095.78,1425.94,1681.61,1876.09,2068.19,2148.72,2156.98/),(/658.36,1078.04,1458.16,1843.39,2126.05,2356.71,2582.74,2665.78,2662.19/),(/1175.96,1713.61,2184.67,2670.15,3003.82,3234.02,3483.82,3535.67,3485.18/),(/517.92,873.16,1193.42,1526.68,1778.77,1976.40,2168.33,2232.29,2235.16/)/)
var6=(/(/146.91,316.28,520.29,789.28,1097.45,1474.04,1764.47,2058.26,2299.31/),(/314.83,541.59,833.77,1166.80,1597.94,2045.53,2451.88,2818.75,3112.10/),(/483.60,754.48,1111.94,1526.42,2020.93,2531.65,3024.20,3450.02,3769.45/),(/730.72,1053.28,1485.27,1994.63,2561.88,3114.85,3722.80,4166.66,4501.34/),(/1335.92,1705.18,2242.31,2857.46,3584.72,4190.53,4960.49,5474.74,5813.95/),(/576.05,850.41,1214.11,1639.30,2140.32,2643.41,3155.13,3564.26,3869.90/)/)
var7=(/(/173.23,307.76,587.33,913.66,985.08,863.55,730.19,570.73,454.75/),(/313.50,537.59,908.97,1323.96,1416.51,1305.87,1149.82,972.24,818.34/),(/453.12,744.84,1182.41,1661.65,1772.25,1690.20,1539.87,1374.20,1213.10/),(/662.15,1015.85,1503.66,2036.04,2173.60,2137.58,2020.63,1897.26,1752.09/),(/1161.54,1575.84,2071.87,2640.13,2826.63,2900.39,2868.13,2854.84,2772.65/),(/530.72,817.09,1236.41,1704.11,1821.61,1760.02,1635.76,1500.02,1360.57/)/)
var8=(/(/205.59,314.81,577.82,950.86,1309.30,1653.68,1961.05,2218.73,2286.22/),(/371.52,536.55,879.23,1351.32,1825.85,2340.42,2853.08,3411.17,3732.71/),(/540.46,737.75,1131.66,1674.84,2242.54,2916.76,3661.06,4558.51,5238.21/),(/799.90,1001.58,1429.12,2029.58,2699.29,3577.23,4635.47,5971.56,7132.93/),(/1406.78,1552.06,1946.97,2605.56,3429.01,4691.22,6289.20,8458.39,10555.65/),(/637.81,809.64,1180.57,1712.58,2288.72,3010.74,3833.50,4843.97,5671.73/)/)
var9=(/(/148.08,266.06,444.66,650.97,796.65,926.54,993.79,1037.56,1007.58/),(/299.76,474.79,723.55,1012.41,1211.95,1400.63,1510.41,1630.53,1651.68/),(/446.48,680.56,994.44,1318.22,1562.25,1794.86,1966.04,2209.32,2360.33/),(/659.46,961.87,1323.78,1672.34,1950.96,2246.25,2511.99,2940.00,3240.49/),(/1194.45,1519.66,1860.50,2215.87,2540.45,3016.04,3456.25,4178.62,4789.96/),(/528.41,759.03,1053.59,1363.13,1602.82,1858.82,2058.64,2359.59,2557.77/)/)
var10=(/(/133.40,376.06,613.38,867.04,975.19,1036.24,1068.65,1073.55,996.36/),(/287.90,610.31,916.03,1250.61,1414.37,1515.70,1616.49,1669.66,1636.58/),(/436.35,837.96,1197.80,1586.85,1779.92,1908.10,2103.13,2269.36,2334.30/),(/663.40,1137.64,1527.08,1946.33,2173.10,2355.69,2673.19,2988.52,3233.90/),(/1205.03,1767.75,2090.99,2463.20,2730.58,3064.57,3626.14,4192.78,4710.80/),(/519.85,922.12,1252.16,1612.08,1808.63,1962.24,2194.67,2403.21,2536.21/)/)

plot = new(10,graphic)

res@tmYLMode             = "Manual"
res@tmYLTickStartF = 0
res@tmYLTickEndF = 3.5
res@tmYLTickSpacingF = 0.5
res@tmYLLabelStride = 2
res@trYMinF               = 0
res@trYMaxF               = 3.5
res@tmYLAutoPrecision = False
res@tmYLPrecision = 1
res@gsnXYFillOpacities = (/0.10,0.10/)
res@xyLineOpacities = (/0,1,0/)

res@tiYAxisString        = "thousand USD / yr"        ; Y-axis title

;119
res@xyLineColors         = (/31,5,31/)          ; Plot line colors
res@gsnXYFillColors = (/5,5/)
plot(0) = gsn_csm_xy(wks,x,0.001*var1(1:3,:),res)

res@xyLineColors         = (/31,11,31/)          ; Plot line colors
res@gsnXYFillColors = (/11,11/)
plot(1) = gsn_csm_xy(wks,x,0.001*var2(1:3,:),res)

res@xyLineColors         = (/31,10,31/)          ; Plot line colors
res@gsnXYFillColors = (/10,10/)
plot(2) = gsn_csm_xy(wks,x,0.001*var3(1:3,:),res)

res@tmYLMode             = "Manual"
res@tmYLTickStartF = 0
res@tmYLTickEndF = 7
res@tmYLTickSpacingF = 1
res@tmYLLabelStride = 2
res@trYMinF               = 0
res@trYMaxF               = 7

res@tiYAxisString        = "" 
res@xyLineColors         = (/31,6,31/)          ; Plot line colors
res@gsnXYFillColors = (/6,6/)
plot(3) = gsn_csm_xy(wks,x,0.001*var4(1:3,:),res)



res@xyLineColors         = (/31,17,31/)          ; Plot line colors
res@gsnXYFillColors = (/17,17/)
plot(4) = gsn_csm_xy(wks,x,0.001*var5(1:3,:),res)


res@xyLineColors         = (/31,16,31/)          ; Plot line colors
res@gsnXYFillColors = (/16,16/)
plot(5) = gsn_csm_xy(wks,x,0.001*var6(1:3,:),res)


res@tmYLMode             = "Manual"


res@xyLineColors         = (/31,15,31/)          ; Plot line colors
res@gsnXYFillColors = (/15,15/)
plot(6) = gsn_csm_xy(wks,x,0.001*var7(1:3,:),res)


res@xyLineColors         = (/31,14,31/)          ; Plot line colors
res@gsnXYFillColors = (/14,14/)
plot(7) = gsn_csm_xy(wks,x,0.001*var8(1:3,:),res)

res@xyLineColors         = (/31,25,31/)          ; Plot line colors
res@gsnXYFillColors = (/25,25/)
plot(8) = gsn_csm_xy(wks,x,0.001*var9(1:3,:),res)

res@xyLineColors         = (/31,26,31/)          ; Plot line colors
res@gsnXYFillColors = (/26,26/)
plot(9) = gsn_csm_xy(wks,x,0.001*var10(1:3,:),res)

overlay(plot(3),plot(4))
overlay(plot(3),plot(5))
overlay(plot(0),plot(2))
overlay(plot(0),plot(1))

overlay(plot(6),plot(9))
overlay(plot(6),plot(8))
overlay(plot(6),plot(7))

;Make panel plot       
resP             = True
resP@gsnMaximize = True
resP@gsnPanelYWhiteSpacePercent = 0.0
resP@gsnPanelXWhiteSpacePercent =   0.0
resP@gsnPanelRight = 0.97
resP@gsnPanelLeft = 0.02
resP@gsnPanelRowSpec = True
gsn_panel(wks,(/plot(0),plot(3),plot(6)/),(/3/),resP)

; END PROGRAM
end