
--acf_y = globalProperty("sim/flightmodel/position/phi")
--acf_x = globalProperty("sim/flightmodel/position/psi")
--acf_z = globalProperty("sim/flightmodel/position/theta")
--localz = 	globalProperty("sim/flightmodel/position/local_z")-
--localx = 	globalProperty("sim/flightmodel/position/local_x")
--localy = 	globalProperty("sim/flightmodel/position/local_y")
--local newlocaly = (dref.get(localy)+0.1)
--jack_me = createGlobalPropertyi("ujs/control/jack_me", 0)
--local can_jack = 0




function mechanics()

if dref.getInt(show_ipad) == 1 then
	if "avitab/panel_enabled" ~= nil then
		avi_powered = dref.getDataref("avitab/panel_powered")
		avi_enabled = dref.getDataref("avitab/panel_enabled")
		dref.setInt(avi_enabled, 1)
		dref.setInt(avi_powered, 1)
	end
end		
	
--(OLD CHANCE) local chance = math.random(0,100)
local chance = math.random() + math.random(1, 99)
dref.setInt(bat_on, 1)
--[[Manipulating coordinates
if dref.getInt(einen_test) == 1 then
	dref.set(localy, dref.get(newlocaly))
	dref.set(acf_z, 0)
end
--]]
---------Yoke Lock Mechanism


if dref.getFloat(control_lock) <= 0.2 then
	dref.setInt(yoke_can_lock, 1)
	dref.setInt(yoke_is_locked, 0)
end

if dref.getInt(yoke_is_locked) == 1 then
	dref.setFloat(yoke_deflection, -1.0)
	dref.setFloat(yoke_roll, 0.0)
	dref.setInt(control_dead, 6)
else
	dref.setInt(control_dead, 0)	
end

if dref.getFloat(control_lock) == 1.0 then
	if dref.getInt(yoke_can_lock) == 1 then
		if dref.getFloat(yoke_deflection) <= -0.9 then
			if dref.getFloat(yoke_roll) <= 0.1 and dref.getFloat(yoke_roll) >= -0.1 then
				dref.setInt(yoke_is_locked, 1)
				dref.setInt(yoke_can_lock, 0)
			else
				dref.setInt(yoke_can_lock, 0)
			end
		else
			dref.setInt(yoke_can_lock, 0)
		end
	end
end

--Tailwheel Locking Mechanism


if dref.getInt(tailwheel_modded) == 0 then
	if dref.getInt(on_ground) == 1 then
	
		if dref.getFloatV(xdr_actual_tail_deg, 1, 1) >= -31 and dref.getFloatV(xdr_actual_tail_deg, 1, 1) <= 31 then
			if dref.getFloat(yoke_deflection) >= 0.3 then
				dref.setFloatV(xdr_tail_lock_ratio, 1, 1)
			end
		else
			dref.setFloatV(xdr_tail_lock_ratio, 1, 0)
		end
	
	--[[if dref.getFloat(yoke_deflection) <= -0.5 then
		dref.setFloatV(xdr_tail_lock_ratio, 1, 0)
	end
	--]]
	end
elseif dref.getInt(tailwheel_modded) == 1 then
		dref.setFloatV(xdr_tail_lock_ratio, 1, 1)
elseif dref.getInt(tailwheel_modded) == 2 then
	dref.setFloatV(xdr_tail_lock_ratio, 1, 0)



	

end

if dref.getInt(tailwheel_modded) == 1 then
	dref.setFloatV(xdr_tail_lock_ratio, 1, 1)
end

----Shows and hides for Strainer sprite

if dref.getInt(strainer_status) == 0 then
	if dref.getInt(oil_show) == 1 then
		dref.setInt(strainer_bad, 1)
	else
		dref.setInt(strainer_bad, 0)
	end
else
	dref.setInt(strainer_bad, 0)
end



if dref.getInt(strainer_status) == 1 then
	if dref.getInt(oil_show) == 1 then
		dref.setInt(strainer_caut, 1)
	else
		dref.setInt(strainer_caut, 0)
	end
else
	dref.setInt(strainer_caut, 0)
end



if dref.getInt(strainer_status) == 2 then
	if dref.getInt(oil_show) == 1 then
		dref.setInt(strainer_good, 1)
	else
		dref.setInt(strainer_good, 0)
	end		
else
	dref.setInt(strainer_good, 0)	
end


-------------------------------------------------------Strainer Causing Misfire

--Converting Strainer seconds to strainer_minutes


if dref.getIntV(xdr_engine_on, 1, 1) == 1 then
	dref.setFloat(oil_is_in, 1)
	dref.setFloat(oil_can_service, 0)
	dref.setFloat(strainer_time, (dref.getFloat(strainer_time)+dref.getFloat(time)))
end
if dref.getFloat(strainer_time) < 108000 then
	dref.setInt(strainer_status, 2)
end
if dref.getFloat(strainer_time) >= 108000 and dref.getFloat(strainer_time) < 180000 then
	dref.setInt(strainer_status, 1)
end
if dref.getFloat(strainer_time) >= 180000 then
	dref.setInt(strainer_status, 0)
end




--Not that bad MISFIRE

if dref.getInt(strainer_status) == 1 then
	if dref.getIntV(xdr_engine_on, 1, 1) == 1 then
		if dref.getFloatV(xdr_RPM, 1, 1) >= 1500 then
			if chance >= 99 then
				dref.setFloatV(xdr_strainer_fail, 1, 0.2)
			else
				if dref.getFloat(engine_timer) >= 0.4 then
					dref.setFloatV(xdr_strainer_fail, 1, 0)
				end
			end
		else
			dref.setFloatV(xdr_strainer_fail, 1, 0)
		end
	end
end

--BIG misfire

if dref.getInt(strainer_status) == 0 then
	if dref.getIntV(xdr_engine_on, 1, 1) == 1 then
		if dref.getFloatV(xdr_RPM, 1, 1) >= 1400 then
			if chance >= 99.6 then
				dref.setFloatV(xdr_strainer_fail, 1, 0.5)
			else
				if dref.getFloat(engine_timer) >= 0.9 then
					dref.setFloatV(xdr_strainer_fail, 1, 0)
				end
			end
		else
			dref.setFloatV(xdr_strainer_fail, 1, 0)
		end
	end
end





if dref.getInt(strainer_status) == 2 then
	dref.setFloatV(xdr_strainer_fail, 1, 0)
end


----------------PRIMER MECHANICS

if dref.getFloatV(xdr_primer_ratio, 1, 1) < 0.2 then
	dref.setInt(can_prime, 1)
end

if dref.getFloatV(xdr_primer_ratio, 1, 1) >= 0.8 then
	if dref.getInt(can_prime) == 1 then
		if dref.getInt(primed) < 15 then
			dref.setInt(primed, (dref.getInt(primed)+1))
			dref.setInt(can_prime, 0)
		end
	end
end

--Evaporation

if dref.getInt(primed) > 0 then
	if dref.getFloatV(xdr_throttle_ratio, 1, 1) >= 0.8 then
		if dref.getFloat(engine_timer) >= 1 then
			dref.setInt(prime_time, (dref.getInt(prime_time)+1))
		end
	end
end
if dref.getInt(prime_time) == 60 then
	if dref.getInt(primed) > 0 then
		dref.setInt(primed, (dref.getInt(primed)-2))
		dref.setInt(prime_time, 0)
	else
		dref.setInt(prime_time, 0)
	end
end

------------
-------------------DISPARO DE HELICE MECHANICS

if dref.getFloatV(xdr_RPM, 1, 1) >= 3300 then
	dref.setInt(disparo, 6)
	dref.setInt(prop_strike, 6)
end

----------EXTINGUISHER MECHANICS
if dref.getInt(extinguish) == 1 then
	dref.setInt(burn_baby, 0)
end

-------THROTTLE PUMP MECHANICS
if dref.getIntV(xdr_engine_on, 1, 1) == 0 then
	if dref.getFloatV(xdr_throttle_ratio, 1, 1) == 1 then
		if dref.getInt(throttle_can_pump) == 1 then
			dref.setInt(throttle_pumped, 1)
			dref.setInt(throttle_can_pump, 0)
		end
	else
		
		if dref.getFloatV(xdr_throttle_ratio, 1, 1) == 0 then
			dref.setInt(throttle_can_pump, 1)
		end
	end
end
if dref.getInt(throttle_pumped) == 1 then
	if dref.getInt(primed) < 15 then 
		dref.setInt(primed, (dref.getInt(primed)+2))
		dref.setInt(throttle_pumped, 0)
	end
end

--Spark Plugs

if dref.getInt(velas_on) == 1 then
	dref.setInt(left_mag_fail, 0)
	dref.setInt(right_mag_fail, 0)
else
	dref.setInt(left_mag_fail, 6)
	dref.setInt(right_mag_fail, 6)
	dref.setFloat(oil_pool, 0.1)
	dref.setInt(primed, 0)
	if dref.getInt(engine_is_hydrolocked) == 1 then
		dref.setInt(engine_is_hydrolocked, 0)
	end
end
	
--Preflight
if dref.getInt(auto_preflight) == 1 then
	if dref.getInt(on_ground) == 1 and dref.getIntV(xdr_engine_on, 1, 1) == 0 then
		
		dref.setInt(pitot_cover, 1)
		dref.setInt(chocks_on, 1)
		dref.setInt(engine_covers, 1)
	else
		dref.setInt(pitot_cover, 0)
		dref.setInt(chocks_on, 0)
		dref.setInt(engine_covers, 0)
	end
end


if dref.getInt(pitot_cover) == 1 then
	dref.setInt(pitot_blocked, 6)
	dref.setInt(altimeter_failed, 6)
else
	dref.setInt(pitot_blocked, 0)
	dref.setInt(altimeter_failed, 0)
end
--Burp sound
if dref.getFloat(acf_roll) < -100 or dref.getFloat(acf_roll) > 100 then
	dref.setInt(acf_coughing, 1)
else
	dref.setInt(acf_coughing, 0)
end

--Rattling Sounds
--[[
if dref.getIntV(xdr_engine_on, 1, 1) == 1 then 
	if dref.getInt(oil_pressure_fail) == 6 or dref.getInt(warmup_fail) >= 6 then
		dref.setInt(rattling_hard, 1)
	else
		dref.setInt(rattling_hard, 0)
	end
else
	dref.setInt(rattling_hard, 0)		
end
--]]

-- This is the new code for rattling turning off on engine off:
if dref.getIntV(xdr_engine_on, 1, 1) == 0 or dref.getInt(warmup_fail) < 6 then
	dref.setInt(rattling_hard, 0)
end 

--Easy Rattling
if dref.getInt(warmup_fail) >= 4 then
	if dref.getIntV(xdr_engine_on, 1, 1) == 1 then
		dref.setInt(rattling_easy, 1)
	else
		dref.setInt(rattling_easy, 0)
	end
else
	dref.setInt(rattling_easy, 0)
end

--Tire sounds

if dref.getFloatV(xdr_tires_rolling, 2, 1) >= 5 and dref.getInt(on_ground) == 1 then
	if dref.getIntV(xdr_on_noisy, 2, 1) == 0 then
	dref.setInt(we_rolling, 1)
	dref.setInt(we_graveling, 0)
	else
		dref.setInt(we_rolling, 0)
		dref.setInt(we_graveling, 1)
	end
else
	dref.setInt(we_rolling, 0)
	dref.setInt(we_graveling, 0)
end
--[[
if dref.get(skidding, 2) >= 0.75 and dref.getInt(on_ground) == 0 then
	dref.set(
--]]

----------------------------------------------------------------------------------------------------TRUEMECH
----Tires---
------------
if dref.getFloat(lgear_remove_smooth) >= 5.5 then
	dref.setInt(ltire_burst, 0)
	dref.setInt(ltire_condition, 0)
	dref.setInt(llanding_count, 0)
end
if dref.getFloat(rgear_remove_smooth) >= 5.5 then
	dref.setInt(rtire_burst, 0)
	dref.setInt(rtire_condition, 0)
	dref.setInt(rlanding_count, 0)
end

if dref.getInt(on_ground) == 0 then
	if dref.getFloat(height) >=1 then
		dref.setInt(can_land, 1)
		dref.setInt(landed, 0)
	end
	--[[Bugs
	if dref.getFloat(oil_tick) >=59 then
		if chance >= 93 then --debugging the bugs
			dref.setInt(can_bug, 1)
			
		end
		else
			dref.setInt(can_bug, 0)
	end
	--]]
else
	dref.setInt(can_bug, 0)
	if dref.getInt(can_land) == 1 then
		dref.setInt(landed, 1)
		
	end
	
	
end

-----------------------Bugs Logic
if dref.getInt(can_bug) == 1 then
	dref.setInt(bugged, 1)
	dref.setInt(can_bug, 0)
end

if dref.getInt(bugged) == 1 then
	if chance >= 0 and chance < 8 then
		if dref.getInt(bg1) == 0 then
			dref.setInt(bg1, 1)
			dref.setInt(bugged, 0)
		end
	end	
	
	if	chance >= 8 and chance < 16 then
			if dref.getInt(bg2) == 0 then
				dref.setInt(bg2, 1)
				dref.setInt(bugged, 0)
			end
	end
	if
		chance >= 16 and chance < 24 then
			if dref.getInt(bg3) == 0 then
				dref.setInt(bg3, 1)
				dref.setInt(bugged, 0)
			end
	end
	if	chance >= 24 and chance < 32 then
			if dref.getInt(bg4) == 0 then
				dref.setInt(bg4, 1)
				dref.setInt(bugged, 0)
			end
	end
	
	if	chance >= 32 and chance < 40 then
			if dref.getInt(bg5) == 0 then
				dref.setInt(bg5, 1)
				dref.setInt(bugged, 0)
			end
	end
	
	if	chance >= 40 and chance < 48 then
			if dref.getInt(bg6) == 0 then
				dref.setInt(bg6, 1)
				dref.setInt(bugged, 0)
			end
	end		
	
	if	chance >= 48 and chance < 56 then
			if dref.getInt(bg7) == 0 then
				dref.setInt(bg7, 1)
				dref.setInt(bugged, 0)
			end	
	end
	if	chance >= 56 and chance < 64 then
			if dref.getInt(bg8) == 0 then
				dref.setInt(bg8, 1)
			
			end
	end
	
	if	chance >= 64 and chance < 72 then
			if dref.getInt(bg9) == 0 then
				dref.setInt(bg9, 1)
				dref.setInt(bugged, 0)
			end	
	end
	
	if	chance >= 72 and chance < 80 then
			if dref.getInt(bg10) == 0 then
				dref.setInt(bg10, 1)
				dref.setInt(bugged, 0)
			end	
	end
	
	if	chance >= 80 and chance < 90 then
			if dref.getInt(bg11) == 0 then
				dref.setInt(bg11, 1)
				dref.setInt(bugged, 0)
			end	
	end
	if	chance >= 90 and chance <= 100 then
			if dref.getInt(bg12) == 0 then
				dref.setInt(bg12, 1)
				dref.setInt(bugged, 0)
			end
	end	
	dref.setInt(bugged, 0)
	
	
end
if dref.getInt(on_jacks) == 0 then
	dref.setInt(can_local_y, 1)
	dref.setIntV(xdr_override_planepath, 1, 0)
end
if dref.getInt(on_jacks) == 1 then
	dref.setInt(chocks_on, 0)
	dref.setIntV(xdr_override_planepath, 1, 1)
	dref.setFloat(theta_pitch,  0)
	
	if dref.getInt(can_local_y) == 1 then
		dref.setFloat(local_y, (dref.getFloat(local_y)+0.2))
		dref.setInt(can_local_y, 0)
	end
	dref.setIntV(xdr_override_planepath, 1, 0)
	dref.setIntV(xdr_override_planepath, 1, 1)
end

--Landing Gear And Jacks

	if dref.getInt(lgear_remove) == 1 then
		if dref.getInt(on_jacks) == 0 then
			dref.setInt(tire_fail2, 6)
			dref.setInt(tire_fail5, 6)
		else
			dref.setInt(tire_fail2, 0)
			dref.setInt(tire_fail5, 0)
		end
	else
		dref.setInt(tire_fail2, 0)
		dref.setInt(tire_fail5, 0)
	end
--Right Gear	
	if dref.getInt(rgear_remove) == 1 then
		if dref.getInt(on_jacks) == 0 then
			dref.setInt(tire_fail3, 6)
			dref.setInt(tire_fail4, 6)
		else
			dref.setInt(tire_fail3, 0)
			dref.setInt(tire_fail4, 0)
		end
	else
		dref.setInt(tire_fail3, 0)
		dref.setInt(tire_fail4, 0)
	end
	
	
--Tire Burst Mechanism
	if dref.getInt(ltire_burst) == 1 then
		if dref.getInt(on_jacks) == 0 then
			dref.setInt(tire_fail2, 6)
			dref.setInt(tire_fail5, 6)
		else
			dref.setInt(tire_fail2, 0)
			dref.setInt(tire_fail5, 0)
		end
	end
	if dref.getInt(rtire_burst) == 1 then
		if dref.getInt(on_jacks) == 0 then
			dref.setInt(tire_fail3, 6)
			dref.setInt(tire_fail4, 6)
		else
			dref.setInt(tire_fail3, 0)
			dref.setInt(tire_fail4, 0)
		end
	end
	
		
		
		
	

if dref.getInt(on_ground) == 0 then
	dref.setInt(can_land, 1)
else
	if dref.getInt(can_land) == 1 then
		dref.setInt(llanding_count, (dref.getInt(llanding_count)+1))
		dref.setInt(rlanding_count, (dref.getInt(rlanding_count)+1))
		dref.setInt(touchdown_vibrate, 1)
		if dref.getInt(ltire_condition) == 2 then
			if chance >= 90 and chance <= 95 then
				dref.setInt(ltire_burst, 1)
				dref.setInt(please_vibrate, 1)
			end
		end
		if dref.getInt(rtire_condition) == 2 then
			if chance >= 55 and chance <= 60 then
				dref.setInt(rtire_burst, 1)
				dref.setInt(touchdown_vibrate, 1)
			end
		end
		dref.setInt(can_land, 0)
	end
end
------------------------------------Wear and tear for left tire
if dref.getInt(llanding_count) <= 100 then
	dref.setInt(ltire_condition, 0)
end
if dref.getInt(llanding_count) > 100 and dref.getInt(llanding_count) <= 150 then
	dref.setInt(ltire_condition, 1)
end
if dref.getInt(llanding_count) > 110 then
	dref.setInt(ltire_condition, 2)
end
--Wear and tear for right tire
if dref.getInt(rlanding_count) <= 100 then
	dref.setInt(rtire_condition, 0)
end
if dref.getInt(rlanding_count) > 100 and dref.getInt(rlanding_count) <= 150 then
	dref.setInt(rtire_condition, 1)
end
if dref.getInt(rlanding_count) > 110 then
	dref.setInt(rtire_condition, 2)
end


--[[
--Changing tires
if dref.get(ltire_changed) == 1 then
	dref.setInt(llanding_count, 0)
	dref.set(bye_lgear, 0)
	dref.set(ltire_changed, 0)
end

--Setting the supports
if dref.get(gear_support) == 1 then
	dref.setInt(tire_fail1, 0)
	dref.setInt(tire_fail2, 0)
	dref.setInt(tire_fail3, 0)
	dref.setInt(tire_fail4, 0)
	dref.setInt(tire_fail5, 0)
else
	if dref.get(lgp_structure) <= 3 then
		dref.set(bye_lgear, 1)
		dref.setInt(tire_fail2, 6)
		dref.setInt(tire_fail4, 6)
	end
end

dref.set(lgp_structure, (dref.get(lgp1)+dref.get(lgp2)+dref.get(lgp3)+dref.get(lgp4)+dref.get(lgp5)+dref.get(lgp6)+dref.get(lgp7)+dref.get(lgp8)))
if dref.get(lgp_structure) == 0 then
	if dref.get(gear_support) == 1 then
		dref.set(can_remove_lgear, 1)
	else
		dref.set(can_remove_lgear, 0)
	end
else
	dref.set(can_remove_lgear, 0)
end

--This turns on the replacement manipulator

if dref.get(bye_lgear) == 1 then
	if dref.get(lgp_structure) == 0 then
		dref.set(lgear_serviceable, 1)
	else
		dref.set(lgear_serviceable, 0)
	end
else
	dref.set(lgear_serviceable, 0)
end

--]]


--Gear dirty mechanics

	if dref.getFloat(height) >= 3 then
		dref.setInt(gdown1, 0)
		--dref.setFloatV(xdr_gearstat, 5, 0)
	else
		dref.setInt(gdown1, 1)
		--dref.setFloatV(xdr_gearstat, 5, 1)
	end
	
--The Treble
	
	if dref.getIntV(xdr_engine_on, 1, 1) == 1 and dref.getInt(is_warm) == 0 then
		if dref.getFloat(our_oil) >= 2 then
			if dref.getFloat(warm_treble) <= 1 then
				dref.setFloat(warm_treble, (dref.getFloat(warm_treble)+dref.getFloat(time)))
			else
				dref.setFloat(warm_treble, 0)
			end
		else
			dref.setFloat(warm_treble, 0)
		end
	else
		dref.setFloat(warm_treble, 0)
	end
	
--Into the wind cooling mechanics

	if dref.getInt(on_ground) == 1 then
		if dref.getFloat(wind_dir) >= (dref.getFloat(our_heading) - 35) and  dref.getFloat(wind_dir) <= (dref.getFloat(our_heading) + 35) then
			dref.setInt(we_cooling, 1)
		else
			dref.setInt(we_cooling, 0)
		end
	else
		dref.setInt(on_jacks, 0)
		dref.setInt(we_cooling, 0)
	end

--Prop disc

	if dref.getFloatV(xdr_RPM, 1, 1) >= 600 then
		dref.setInt(is_prop, 1)
	else
		dref.setInt(is_prop, 0)
	end
	
--Abuse MECHANICS	
	if dref.getIntV(xdr_engine_on, 1, 1) == 1 then
		dref.setInt(on_jacks, 0)
		if dref.getFloatV(xdr_throttle_ratio, 1, 1) >= 0.97 then
			dref.setFloatV(xdr_oil_temp_actual, 1, ((dref.getFloat(time)*1.3)+dref.getFloatV(xdr_oil_temp_actual, 1, 1)))
		end
	end
	
--Fake crank mechanics
	if dref.getInt(luggage_door) == 1 then
		if dref.getInt(is_crank_on) == 0 then
			dref.setInt(show_fake_crank, 1)
		else
			dref.setInt(show_fake_crank, 0)
		end
	else
		dref.setInt(show_fake_crank, 0)
	end
	
	
--Quick External
	if dref.getFloat(quick_external) == 1 then
		dref.setInt(engine_covers, 1)
		dref.setInt(chocks_on, 1)
		dref.setInt(pitot_cover, 1)
		dref.setFloat(quick_external, 0)
	end
	
--[[RearJack
if dref.get(jack_me) == 1 then
	dref.setFloatV(xdr_gearstat, 5, (dref.getFloatV(xdr_gearstat, 5, 1) + 0.25))
	dref.set(gdown3, (dref.get(gdown3) + 0.25))
	dref.set(jack_me, 0)
end
--]]

--Hydraulic Fluid Simulation

	if dref.getFloat(hydro_time) <= 60 then
		dref.setFloat(hydro_time, (dref.getFloat(hydro_time)+dref.getFloat(time)))
	else
		if dref.getInt(hydro_left) > 0 then
			dref.setInt(hydro_left, (dref.getInt(hydro_left) - 1))
		end
		dref.setFloat(hydro_time, 0)
	end
	
	if dref.getInt(hydro_left) < 400 then
		dref.setInt(r_brake_fail, 6)
		dref.setInt(l_brake_fail, 6)
	else
		dref.setInt(r_brake_fail, 0)
		dref.setInt(l_brake_fail, 0)
	end
	
--OIL DRIP
	--Valve operation
	if dref.getFloat(y_drain) >= 70 then
		dref.setInt(y_drip, 1)
	else
		dref.setInt(y_drip, 0)
	end
	--Dripping
	if dref.getInt(y_drip) == 1 then
		if dref.getFloat(our_oil) > 1 then
			dref.setFloat(our_oil, (dref.getFloat(our_oil)-(dref.getFloat(time)*3)))
			dref.setFloatV(xdr_oilquan, 1, (dref.getFloatV(xdr_oilquan, 1, 1)-(dref.getFloat(time)*2)))
			if dref.getFloat(oil_age) <= 2.5 then
				dref.setInt(oil_drip_good, 1)
			else
				dref.setInt(oil_drip_good, 0)
			end
			if dref.getFloat(oil_age) > 2.5 and dref.getFloat(oil_age) <= 5 then
				dref.setInt(oil_drip_semigood, 1)
			else
				dref.setInt(oil_drip_semigood, 0)
			end
			if dref.getFloat(oil_age) > 5 and dref.getFloat(oil_age) <= 7.5 then
				dref.setInt(oil_drip_semibad, 1)
			else
				dref.setInt(oil_drip_semibad, 0)
			end
			if dref.getFloat(oil_age) > 7.5 then
				dref.setInt(oil_drip_bad, 1)
			else
				dref.setInt(oil_drip_bad, 0)
			end
		else
			dref.setInt(oil_drip_bad, 0)
			dref.setInt(oil_drip_good, 0)
			dref.setInt(oil_drip_semibad, 0)
			dref.setInt(oil_drip_semigood, 0)
		end
	else
		dref.setInt(oil_drip_bad, 0)
		dref.setInt(oil_drip_good, 0)
		dref.setInt(oil_drip_semibad, 0)
		dref.setInt(oil_drip_semigood, 0)
	end
	
--Oil Cap limits
	if dref.getFloat(oil_is_in) == 0 then
		dref.setFloat(oil_can_service, 1)
	end
--New Oil
	if dref.getFloat(our_oil) <= 1 then
		dref.setFloat(oil_age, 0)
	end
--Oil can service
	if dref.getFloat(oil_cap) == 1 then
		dref.setInt(oil_can_service, 1)
	else
		if dref.getInt(right_cowling_on) == 1 then
			dref.setInt(oil_can_service, 0)
			dref.setFloat(oil_is_in, 1)
		else
			dref.setInt(oil_can_service, 1)
		end
	end
	if dref.getInt(right_cowling_on) == 0 then
		dref.setFloat(oil_can_service, 1)
		dref.setFloat(oil_cap, 1)
	end
--Oil Refill

	if dref.getInt(refilling_oil) == 1 then
		dref.setFloat(oil_in_line, 0)
			if dref.getFloat(our_oil) <= 15 then
				dref.setFloat(our_oil, (dref.getFloat(our_oil)+(dref.getFloat(time)*5)))
				dref.setFloatV(xdr_oilquan, 1, (dref.getFloatV(xdr_oilquan, 1, 1)+(dref.getFloat(time)*5)))
				
			end
	end
--Dsuz

	if dref.getInt(rcr1) == 0 and dref.getInt(rcr2) == 0 and dref.getInt(rcr3) == 0 and dref.getInt(rcr4) == 0 then
		dref.setInt(right_cowling_can_open, 1)
		if dref.getFloat(IAS) >= 10 then
			dref.setInt(right_cowling_on, 0)
		end
	else
		dref.setInt(right_cowling_can_open, 0)
	end
	
	if dref.getInt(lcr1) == 0 then 
		if dref.getInt(lcr2) == 0 then 
			if dref.getInt(lcr3) == 0 then
				if dref.getInt(lcr4) == 0 then 
					if dref.getInt(lcr5) == 0 then 
						if dref.getInt(lcr6) == 0 then 
							if dref.getInt(lcr7) == 0 then 
								if dref.getInt(lcr8) == 0 then 
									if dref.getInt(lcr9) == 0 then
										dref.setInt(left_cowling_can_open, 1)
										if dref.getFloat(IAS) >= 10 then
											dref.setInt(left_cowling_on, 0)
										end
									else
										dref.setInt(left_cowling_can_open, 0)
									end
								else
									dref.setInt(left_cowling_can_open, 0)
								end
							else
								dref.setInt(left_cowling_can_open, 0)
							end
						else
							dref.setInt(left_cowling_can_open, 0)
						end
					else
						dref.setInt(left_cowling_can_open, 0)
					end
				else
					dref.setInt(left_cowling_can_open, 0)
				end
			else
				dref.setInt(left_cowling_can_open, 0)
			end
		else
			dref.setInt(left_cowling_can_open, 0)
		end
	else
		dref.setInt(left_cowling_can_open, 0)
	end	
	
	if dref.getInt(left_cowling_on) == 1 then
		dref.setFloat(filter_tray, 0)
	end
	
-- PRIMER Lock
	if dref.getInt(primer_cock) == 0 then
		dref.setFloatV(xdr_primer_ratio, 1, 1)
	end
--Cooling Crackling
	if dref.getFloat(oil_temp) >= 50 and dref.getIntV(xdr_engine_on, 1, 1) == 0 then
		if dref.getFloat(oil_pool) <= 1 then
			dref.setInt(cooling_crackling, 1)
		else
			dref.setInt(cooling_crackling, 0)
		end
	else
		dref.setInt(cooling_crackling, 0)
	end
--Oil in line
	if dref.getFloat(oil_in_line) >= 0 and dref.getFloat(oil_in_line) <= 3 then
		if dref.getIntV(xdr_engine_on, 1, 1) == 0 then 
			if dref.getFloat(oil_pool) <= 3 then
				dref.setFloat(oil_in_line, (dref.getFloat(oil_in_line)+(dref.getFloat(time)/100)))
			end
		else
			dref.setFloat(oil_in_line, 0)
		end
	end
	
	if dref.getFloat(oil_in_line) >= 2 then
		dref.setInt(oil_in_line_can_burp, 1)
	end
	
	if dref.getFloat(oil_in_line) <= 0.1 then
		if dref.getInt(oil_in_line_can_burp) == 1 then
			dref.setInt(oil_in_line_burps, 1)
			dref.setInt(oil_in_line_can_burp, 0)
		end
	end
	
	if dref.getInt(oil_in_line_burps) == 1 then
		if chance >= 90 then
			dref.setInt(oil_in_line_burps, 0)
		end
	end
--Luggage and Trincos

	if dref.getInt(trinco1) == 1 and dref.getInt(trinco2) == 1 then
		dref.setInt(luggage_can_open, 1)
	else
		dref.setInt(luggage_can_open, 0)
	end
	if dref.getInt(luggage_door) == 1 then
		dref.setInt(trinco1, 1)
		dref.setInt(trinco2, 1)
	end
	
--Vibrations

--On Touchdown
	if dref.getInt(touchdown_vibrate) == 1 then
		if dref.getFloat(touchdown_timer) <= 0.5 then
			dref.setFloat(touchdown_timer, (dref.getFloat(touchdown_timer)+dref.getFloat(time)))
		else	
			dref.setFloat(touchdown_timer, 0)
			dref.setInt(touchdown_vibrate, 0)
		end
	end

	if dref.getFloatV(xdr_RPM, 1, 1) >= 10 and dref.getFloatV(xdr_RPM, 1, 1) <= 300 then
		dref.setInt(please_vibrate, 1)
	elseif dref.getFloat(is_stalling) == 1 then
		dref.setInt(hardcore_vibration, 1)
	elseif dref.getInt(rattling_hard) == 1 then
		dref.setInt(hardcore_vibration, 1)
	
	elseif dref.getInt(touchdown_vibrate) == 1 then
		dref.setInt(please_vibrate, 1)		
	else
		dref.setInt(please_vibrate, 0)
		dref.setInt(hardcore_vibration, 0)
	end
	--Simple vibration
	if dref.getInt(please_vibrate) == 1 then
		if dref.getInt(vibration_peak) == 0 then
			if dref.getFloat(panel_vibration) <= 0.01 then
				dref.setFloat(panel_vibration, (dref.getFloat(panel_vibration)+(dref.getFloat(time)*25)))
			else
				dref.setInt(vibration_peak, 1)
			end
		else
			if dref.getFloat(panel_vibration) >= 0 then
				dref.setFloat(panel_vibration, (dref.getFloat(panel_vibration)-(dref.getFloat(time)*25)))
			else
				dref.setInt(vibration_peak, 0)
			end
		end
	else
		if dref.getInt(hardcore_vibration) == 0 then
			dref.setFloat(panel_vibration, 0)
		end
	end

	--Hardcore vibration

	if dref.getInt(hardcore_vibration) == 1 then
		if dref.getInt(vibration_peak) == 0 then
			if dref.getFloat(panel_vibration) <= 0.04 then
				dref.setFloat(panel_vibration, (dref.getFloat(panel_vibration)+(dref.getFloat(time)*70)))
			else
				dref.setInt(vibration_peak, 1)
			end
		else
			if dref.getFloat(panel_vibration) >= 0 then
				dref.setFloat(panel_vibration, (dref.getFloat(panel_vibration)-(dref.getFloat(time)*50)))
			else
				dref.setInt(vibration_peak, 0)
			end
		end
	else
		if dref.getInt(please_vibrate) == 0 then
			dref.setFloat(panel_vibration, 0)
		end
	end
	
--Refuelling

	if dref.getInt(rfuel_cap) == 0 then
		dref.setInt(rfuel_pouring, 0)
	end
	if dref.getInt(lfuel_cap) == 0 then
		dref.setInt(lfuel_pouring, 0)
	end

	if dref.getFloat(rfuel_pouring_smooth) == 1 then
		if dref.getFloat(rfuel_qty) <= 68 then
			dref.setFloat(rfuel_qty, (dref.getFloat(rfuel_qty)+(dref.getFloat(time)*4)))
		else
			dref.setInt(rfuel_pouring, 0)
		end
	--else
		--dref.setInt(rfuel_pouring, 0)
	end
	
	if dref.getFloat(lfuel_pouring_smooth) == 1 then
		if dref.getFloat(lfuel_qty) <= 68 then
			dref.setFloat(lfuel_qty, (dref.getFloat(lfuel_qty)+(dref.getFloat(time)*4)))
		else
			dref.setInt(lfuel_pouring, 0)
		end
	--else	
		--dref.setInt(lfuel_pouring, 0)
	
	end
	
--Tailwheel scraping

	if dref.getIntV(xdr_tailwheel_contact, 1, 1) == 1 then
		if dref.getFloat(yoke_deflection) >= 0.5 and dref.getFloat(IAS) >= 10 then
			dref.setInt(tailwheel_scraping, 1)
		else
			dref.setInt(tailwheel_scraping, 0)
		end
	else
		dref.setInt(tailwheel_scraping, 0)
	end
	
--Rolling Flat

	if dref.getInt(ltire_burst) == 1 or dref.getInt(rtire_burst) == 1 then
		if dref.getInt(on_ground) == 1 and dref.getFloat(IAS) >= 5 then
			dref.setInt(rolling_flat, 1)
		else
			dref.setInt(rolling_flat, 0)
		end
	else
		dref.setInt(rolling_flat, 0)
	end
--Drawing Tire Status	
if dref.getInt(llanding_count) >= 100 or dref.getInt(rlanding_count) >= 100 then
	dref.setInt(tires_status, 1)
else
	dref.setInt(tires_status, 0)
end

--Fuel cap left open!

if dref.getInt(lfuel_cap) == 1 and dref.getInt(on_ground) == 0 then
	if dref.getFloat(lfuel_qty) > 0 then
		dref.setFloat(lfuel_qty, (dref.getFloat(lfuel_qty)-(dref.getFloat(time)/5)))
	end
end

if dref.getInt(rfuel_cap) == 1 and dref.getInt(on_ground) == 0 then
	if dref.getFloat(rfuel_qty) > 0 then
		dref.setFloat(rfuel_qty, (dref.getFloat(rfuel_qty)-(dref.getFloat(time)/5)))
	end
end

if dref.getInt(on_jacks) == 1 then
	dref.setInt(tailwheel_inspection, 1)
else
	dref.setInt(tailwheel_inspection, 0)
end

--Parking Brakes

if dref.getFloat(pbrake) >= 0.8 then
	dref.setInt(override_brakes, 1)
		if dref.getFloat(left_toe_brakes) < 1 then
			dref.setFloat(left_toe_brakes, (dref.getFloat(left_toe_brakes)+(dref.getFloat(time)*3)))
		elseif dref.getFloat(left_toe_brakes) > 1 then
			dref.setFloat(left_toe_brakes, 1)
		end
		if dref.getFloat(right_toe_brakes) < 1 then
			dref.setFloat(right_toe_brakes, (dref.getFloat(right_toe_brakes)+(dref.getFloat(time)*3)))
		elseif dref.getFloat(right_toe_brakes) > 1 then
			dref.setFloat(right_toe_brakes, 1)
		end
	--dref.setFloat(right_toe_brakes, 1)
	dref.setInt(brake_gates, 1)
else
	dref.setInt(override_brakes, 0)
	if dref.getInt(brake_gates) == 1 then
		dref.setFloat(left_toe_brakes, 0)
		dref.setFloat(right_toe_brakes, 0)
		dref.setInt(brake_gates, 0)
	end
end


	
	
	
	

	

	
	
	
	
	
	
	
	
	
	




end