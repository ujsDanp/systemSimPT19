--smothener


function smoothener()
--Oil dipstick smoothener

if dref.getFloat(oil_is_in) == 0 then
	if dref.getFloat(oil_is_in_smooth) < 2 then
		dref.setFloat(oil_is_in_smooth, (dref.getFloat(oil_is_in_smooth)+dref.getFloat(time)))
	end
elseif dref.getFloat(oil_is_in) == 1 then
	if dref.getFloat(oil_is_in_smooth) > 0 then
		dref.setFloat(oil_is_in_smooth, (dref.getFloat(oil_is_in_smooth)-dref.getFloat(time)))
	end
end
if dref.getFloat(oil_is_in_smooth) > 2 then
	dref.setFloat(oil_is_in_smooth, 2)
end
--Oil Cap Smoothener
if dref.getFloat(oil_cap) == 1 then
	if dref.getFloat(oil_cap_smooth) < 1 then
		dref.setFloat(oil_cap_smooth, (dref.getFloat(oil_cap_smooth)+dref.getFloat(time)*2))
	end
elseif dref.getFloat(oil_cap) == 0 then
	if dref.getFloat(oil_cap_smooth) > 0 then
		dref.setFloat(oil_cap_smooth, (dref.getFloat(oil_cap_smooth)-dref.getFloat(time)*2))
	end
end
if dref.getFloat(oil_cap_smooth) < 0  then
	dref.setFloat(oil_cap_smooth, 0)
end

--Fire door smoothener
if dref.getInt(fire_door) == 1 then
	if dref.getFloat(fire_door_smooth) < 0.7 then
		dref.setFloat(fire_door_smooth, (dref.getFloat(fire_door_smooth)+dref.getFloat(time)))
	end
elseif dref.getInt(fire_door) == 0 then
	if dref.getFloat(fire_door_smooth) > 0 then
		dref.setFloat(fire_door_smooth, (dref.getFloat(fire_door_smooth)-dref.getFloat(time)))
	end
end
--Animation fixer for door smoothener
	if dref.getFloat(fire_door_smooth) < 0 then
		dref.setFloat(fire_door_smooth, 0)
	end
	
--Primer Smoothener
if dref.getInt(primer_smooth) == 1 then
	if dref.getFloatV(xdr_primer_ratio, 1, 1) <= 1 then
		dref.setFloatV(xdr_primer_ratio, 1, (dref.getFloatV(xdr_primer_ratio, 1, 1)+(dref.getFloat(time)*2)))
	end
elseif dref.getInt(primer_smooth) == 0 then
	if dref.getFloatV(xdr_primer_ratio, 1, 1) > 0 then
		dref.setFloatV(xdr_primer_ratio, 1, (dref.getFloatV(xdr_primer_ratio, 1, 1)-(dref.getFloat(time)*2)))
	end
end	

--Primer Cock Smoothener
if dref.getInt(primer_cock) == 1 then
	if dref.getFloat(primer_cock_smooth) < 0.5 then
		dref.setFloat(primer_cock_smooth, (dref.getFloat(primer_cock_smooth)+(dref.getFloat(time)*2.4)))
	end
elseif dref.getInt(primer_cock) == 0 then
	if dref.getFloat(primer_cock_smooth) > 0 then
		dref.setFloat(primer_cock_smooth, (dref.getFloat(primer_cock_smooth)-(dref.getFloat(time)*2.4)))
	end
end	

--Luggage Door Smoothener

if dref.getInt(luggage_door) == 1 then
	if dref.getFloat(luggage_door_smooth) < 0.5 then
		dref.setFloat(luggage_door_smooth, (dref.getFloat(luggage_door_smooth)+(dref.getFloat(time)*4)))
	end
elseif dref.getInt(luggage_door) == 0 then
	if dref.getFloat(luggage_door_smooth) > 0 then
		dref.setFloat(luggage_door_smooth, (dref.getFloat(luggage_door_smooth)-(dref.getFloat(time)*4)))
	end
end
if dref.getFloat(luggage_door_smooth) < 0 then
	dref.setFloat(luggage_door_smooth, 0)
end

--Trincos smootheners
--1
if dref.getInt(trinco1) == 1 then
	if dref.getFloat(trinco1_smooth) < 1 then
		dref.setFloat(trinco1_smooth, (dref.getFloat(trinco1_smooth)+(dref.getFloat(time)*2.5)))
	end
elseif dref.getInt(trinco1) == 0 then
	if dref.getFloat(trinco1_smooth) > 0 then
		dref.setFloat(trinco1_smooth, (dref.getFloat(trinco1_smooth)-(dref.getFloat(time)*2.5)))
	end
end	
-- and 2
if dref.getInt(trinco2) == 1 then
	if dref.getFloat(trinco2_smooth) < 1 then
		dref.setFloat(trinco2_smooth, (dref.getFloat(trinco2_smooth)+(dref.getFloat(time)*2.5)))
	end
elseif dref.getInt(trinco2) == 0 then
	if dref.getFloat(trinco2_smooth) > 0 then
		dref.setFloat(trinco2_smooth, (dref.getFloat(trinco2_smooth)-(dref.getFloat(time)*2.5)))
	end
end	

--LGEAR REMOVE SMOOTHENER

if dref.getInt(lgear_remove) == 1 then
	
	if dref.getFloat(lgear_remove_smooth) < 6 then
		dref.setFloat(lgear_remove_smooth, (dref.getFloat(lgear_remove_smooth)+(dref.getFloat(time)*1)))
	end
elseif dref.getInt(lgear_remove) == 0 then
	if dref.getFloat(lgear_remove_smooth) > 0 then
		dref.setFloat(lgear_remove_smooth, (dref.getFloat(lgear_remove_smooth)-(dref.getFloat(time)*1)))
	end
end	

if dref.getFloat(lgear_remove_smooth) > 6 then
	dref.setFloat(lgear_remove_smooth, 6)
end
if dref.getFloat(lgear_remove_smooth) < 0 then
	dref.setFloat(lgear_remove_smooth, 0)
end

--Right gear

if dref.getInt(rgear_remove) == 1 then
	
	if dref.getFloat(rgear_remove_smooth) < 6 then
		dref.setFloat(rgear_remove_smooth, (dref.getFloat(rgear_remove_smooth)+(dref.getFloat(time)*1)))
	end
elseif dref.getInt(rgear_remove) == 0 then
	if dref.getFloat(rgear_remove_smooth) > 0 then
		dref.setFloat(rgear_remove_smooth, (dref.getFloat(rgear_remove_smooth)-(dref.getFloat(time)*1)))
	end
end	

if dref.getFloat(rgear_remove_smooth) > 6 then
	dref.setFloat(rgear_remove_smooth, 6)
end
if dref.getFloat(rgear_remove_smooth) < 0 then
	dref.setFloat(rgear_remove_smooth, 0)
end


--Fuel Caps

if dref.getInt(lfuel_cap) == 1 then
	
	if dref.getFloat(lfuel_cap_smooth) < 1 then
		dref.setFloat(lfuel_cap_smooth, (dref.getFloat(lfuel_cap_smooth)+(dref.getFloat(time)*1.4)))
	end
elseif dref.getInt(lfuel_cap) == 0 then
	if dref.getFloat(lfuel_cap_smooth) > 0 then
		dref.setFloat(lfuel_cap_smooth, (dref.getFloat(lfuel_cap_smooth)-(dref.getFloat(time)*1.4)))
	end
end	

if dref.getFloat(lfuel_cap_smooth) > 1 then
	dref.setFloat(lfuel_cap_smooth, 1)
end
if dref.getFloat(lfuel_cap_smooth) < 0 then
	dref.setFloat(lfuel_cap_smooth, 0)
end

--And the right one

if dref.getInt(rfuel_cap) == 1 then
	
	if dref.getFloat(rfuel_cap_smooth) < 1 then
		dref.setFloat(rfuel_cap_smooth, (dref.getFloat(rfuel_cap_smooth)+(dref.getFloat(time)*1.4)))
	end
elseif dref.getInt(rfuel_cap) == 0 then
	if dref.getFloat(rfuel_cap_smooth) > 0 then
		dref.setFloat(rfuel_cap_smooth, (dref.getFloat(rfuel_cap_smooth)-(dref.getFloat(time)*1.4)))
	end
end	

if dref.getFloat(rfuel_cap_smooth) > 1 then
	dref.setFloat(rfuel_cap_smooth, 1)
end
if dref.getFloat(rfuel_cap_smooth) < 0 then
	dref.setFloat(rfuel_cap_smooth, 0)
end

--Fuel Caps

if dref.getInt(rfuel_pouring) == 1 then
	
	if dref.getFloat(rfuel_pouring_smooth) < 1 then
		dref.setFloat(rfuel_pouring_smooth, (dref.getFloat(rfuel_pouring_smooth)+(dref.getFloat(time)*1.4)))
	end
elseif dref.getInt(rfuel_pouring) == 0 then
	if dref.getFloat(rfuel_pouring_smooth) > 0 then
		dref.setFloat(rfuel_pouring_smooth, (dref.getFloat(rfuel_pouring_smooth)-(dref.getFloat(time)*1.4)))
	end
end	

if dref.getFloat(rfuel_pouring_smooth) > 1 then
	dref.setFloat(rfuel_pouring_smooth, 1)
end
if dref.getFloat(rfuel_pouring_smooth) < 0 then
	dref.setFloat(rfuel_pouring_smooth, 0)
end
--Left
if dref.getInt(lfuel_pouring) == 1 then
	
	if dref.getFloat(lfuel_pouring_smooth) < 1 then
		dref.setFloat(lfuel_pouring_smooth, (dref.getFloat(lfuel_pouring_smooth)+(dref.getFloat(time)*1.4)))
	end
elseif dref.getInt(lfuel_pouring) == 0 then
	if dref.getFloat(lfuel_pouring_smooth) > 0 then
		dref.setFloat(lfuel_pouring_smooth, (dref.getFloat(lfuel_pouring_smooth)-(dref.getFloat(time)*1.4)))
	end
end	

if dref.getFloat(lfuel_pouring_smooth) > 1 then
	dref.setFloat(lfuel_pouring_smooth, 1)
end
if dref.getFloat(lfuel_pouring_smooth) < 0 then
	dref.setFloat(lfuel_pouring_smooth, 0)
end




















end --UPDATE END
