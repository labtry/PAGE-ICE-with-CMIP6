; Below is an NCL script example for processing CMIP6 data.
; This code is used to convert downloaded 'tas' data from monthly values to annual averages.

begin
    f1 = addfile ("I:/UKESM1-0-LL/tas_Amon_UKESM1-0-LL_G6solar_r4i1p1f2_gn_202001-204912.nc","r")
    f2 = addfile ("I:/UKESM1-0-LL/tas_Amon_UKESM1-0-LL_G6solar_r8i1p1f2_gn_202001-204912.nc","r")
    f3 = addfile ("I:/UKESM1-0-LL/tas_Amon_UKESM1-0-LL_G6sulfur_r4i1p1f2_gn_202001-204912.nc","r")
    f4 = addfile ("I:/UKESM1-0-LL/tas_Amon_UKESM1-0-LL_G6sulfur_r8i1p1f2_gn_202001-204912.nc","r")
	f11 = addfile ("I:/UKESM1-0-LL/tas_Amon_UKESM1-0-LL_G6solar_r4i1p1f2_gn_205001-210012.nc","r")
    f12 = addfile ("I:/UKESM1-0-LL/tas_Amon_UKESM1-0-LL_G6solar_r8i1p1f2_gn_205001-210012.nc","r")
    f13 = addfile ("I:/UKESM1-0-LL/tas_Amon_UKESM1-0-LL_G6sulfur_r4i1p1f2_gn_205001-210012.nc","r")
    f14 = addfile ("I:/UKESM1-0-LL/tas_Amon_UKESM1-0-LL_G6sulfur_r8i1p1f2_gn_205001-210012.nc","r")
	
    fout1 = addfile ("I:/tas_UKESM1-0-LL_G6solar4_2015-2100.nc", "c")
    fout2 = addfile ("I:/tas_UKESM1-0-LL_G6solar8_2015-2100.nc", "c")
    fout3 = addfile ("I:/tas_UKESM1-0-LL_G6sulfur4_2015-2100.nc", "c")
    fout4 = addfile ("I:/tas_UKESM1-0-LL_G6sulfur8_2015-2100.nc", "c")
	fref = addfile ("I:/tas_UKESM1-0-LL_ssp585_2015-2100.nc", "r")
	
	fout1->tas=fref->tas
    fout2->tas=fref->tas
    fout3->tas=fref->tas
    fout4->tas=fref->tas
    
    fout1->tas(5:34,:,:)=(/month_to_annual(f1->tas,1)/)
    fout2->tas(5:34,:,:)=(/month_to_annual(f2->tas,1)/)
    fout3->tas(5:34,:,:)=(/month_to_annual(f3->tas,1)/)
    fout4->tas(5:34,:,:)=(/month_to_annual(f4->tas,1)/)
	fout1->tas(35:85,:,:)=(/month_to_annual(f11->tas,1)/)
    fout2->tas(35:85,:,:)=(/month_to_annual(f12->tas,1)/)
    fout3->tas(35:85,:,:)=(/month_to_annual(f13->tas,1)/)
    fout4->tas(35:85,:,:)=(/month_to_annual(f14->tas,1)/)
end
