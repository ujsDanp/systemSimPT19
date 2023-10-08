
function starter()

dref.setInt(cube_prep_mode, 2)
if dref.getInt(is_crank_on) == 0 then
	dref.setFloat(crank_deg, 1)
end

--[[if dref.getFloat(oil_temp) < 0 then
	dref.setFloat(oil_temp, 0)
end
if dref.getFloatV(xdr_oil_temp_actual, 1, 1) < 0 then
	dref.setFloatV(xdr_oil_temp_actual, 1, 0)
end
--]]
--This will fire the starter

--Soundboard

-- (OLD CHANCE) local chance = math.random(0,100)
local chance = math.random() + math.random(1, 99)
dref.setFloatV(charge, 1, 999999)
	if dref.getInt(fire) == 1 then
		if dref.getInt(trigger) == 1 then
			--Our entry point to create custom start modes
			if dref.getInt(starter_switch) == 1 then			--See? This is our first custom starter for the Right Magneto start botching. 20% chance to succeed RIGHT MAG
				if dref.getInt(primed) >= 13 then --Burns if overprimed nonetheless
					dref.setInt(burn_baby, 6)
					dref.setInt(fire_partner, 6)
					dref.setInt(primed, 0)
				end
				if dref.getInt(is_warm) == 0 then
					if dref.getInt(primed) < 2 or dref.getInt(primed) > 8 and dref.getInt(primed) < 13 then --MINIMUM PRIMING FOR COLD START ON RIGHT MAG
						dref.setInt(mini_botch, 1)
					end
					if dref.getInt(primed) >= 2 and dref.getInt(primed) <= 8 then
						if dref.getInt(new_boy) == 1 then
						dref.setIntV(xdr_ignite, 1, 4)
						dref.setIntV(xdr_ignite, 1, 4)
						dref.setIntV(xdr_ignite, 1, 4)
						dref.setIntV(xdr_ignite, 1, 4)
						dref.setIntV(xdr_ignite, 1, 4)
						dref.setInt(primed, 0)
						dref.setInt(fire, 0)
					elseif	dref.getInt(getting_older) == 1 then
						if chance <= 90 then
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setInt(primed, 0)
							dref.setInt(fire, 0)
						else
							dref.setInt(botched, 1)
							
						end
					elseif dref.getInt(getting_more_older) == 1 then
						if chance <= 80 then
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setInt(primed, 0)
							dref.setInt(fire, 0)
						else
							dref.setInt(botched, 1)
							
						end
					elseif dref.getInt(pretty_beaten) == 1 then
						if chance <= 40 then
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setInt(primed, 0)
							dref.setInt(fire, 0)
						else
							dref.setInt(botched, 1)
						end
						end
						--dref.setInt(trigger, 0)
					end
				else
					if dref.getInt(new_boy) == 1 then
						dref.setIntV(xdr_ignite, 1, 4)
						dref.setIntV(xdr_ignite, 1, 4)
						dref.setIntV(xdr_ignite, 1, 4)
						dref.setIntV(xdr_ignite, 1, 4)
						dref.setIntV(xdr_ignite, 1, 4)
						dref.setInt(primed, 0)
						dref.setInt(fire, 0)
					elseif	dref.getInt(getting_older) == 1 then
						if chance <= 90 then
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setInt(primed, 0)
							dref.setInt(fire, 0)
						else
							dref.setInt(botched, 1)
							
						end
					elseif dref.getInt(getting_more_older) == 1 then
						if chance <= 80 then
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setInt(primed, 0)
							dref.setInt(fire, 0)
						else
							dref.setInt(botched, 1)
							
						end
					elseif dref.getInt(pretty_beaten) == 1 then
						if chance <= 40 then
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setInt(primed, 0)
							dref.setInt(fire, 0)
						else
							dref.setInt(botched, 1)
						end
					end
				end
				
				
			end
			if dref.getInt(starter_switch) == 2 then  --Left mag
				if dref.getInt(primed) >= 13 then --Burns if overprimed nonetheless
					dref.setInt(burn_baby, 6)
					dref.setInt(fire_partner, 6)
					dref.setInt(primed, 0)
				end
				if dref.getInt(is_warm) == 0 then
					if dref.getInt(primed) < 2 or dref.getInt(primed) > 8 and dref.getInt(primed) < 13 then --MINIMUM PRIMING REQUIRED FOR LEFT MAG COLD START
						dref.setInt(mini_botch, 1)
					end
					if dref.getInt(primed) >= 2 and dref.getInt(primed) <= 8  then
						if dref.getInt(new_boy) == 1 then
						dref.setIntV(xdr_ignite, 1, 4)
						dref.setIntV(xdr_ignite, 1, 4)
						dref.setIntV(xdr_ignite, 1, 4)
						dref.setIntV(xdr_ignite, 1, 4)
						dref.setIntV(xdr_ignite, 1, 4)
						dref.setInt(primed, 0)
						dref.setInt(fire, 0)
					elseif	dref.getInt(getting_older) == 1 then
						if chance <= 90 then
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setInt(primed, 0)
							dref.setInt(fire, 0)
						else
							dref.setInt(botched, 1)
							
						end
					elseif dref.getInt(getting_more_older) == 1 then
						if chance <= 80 then
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setInt(primed, 0)
							dref.setInt(fire, 0)
						else
							dref.setInt(botched, 1)
							
						end
					elseif dref.getInt(pretty_beaten) == 1 then
						if chance <= 40 then
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setInt(primed, 0)
							dref.setInt(fire, 0)
						else
							dref.setInt(botched, 1)
						end
						end
						--dref.setInt(trigger, 0)
					end
				else
					if dref.getInt(new_boy) == 1 then
						dref.setIntV(xdr_ignite, 1, 4)
						dref.setIntV(xdr_ignite, 1, 4)
						dref.setIntV(xdr_ignite, 1, 4)
						dref.setIntV(xdr_ignite, 1, 4)
						dref.setIntV(xdr_ignite, 1, 4)
						dref.setInt(primed, 0)
						dref.setInt(fire, 0)
					elseif	dref.getInt(getting_older) == 1 then
						if chance <= 90 then
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setInt(primed, 0)
							dref.setInt(fire, 0)
						else
							dref.setInt(botched, 1)
							
						end
					elseif dref.getInt(getting_more_older) == 1 then
						if chance <= 80 then
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setInt(primed, 0)
							dref.setInt(fire, 0)
						else
							dref.setInt(botched, 1)
							
						end
					elseif dref.getInt(pretty_beaten) == 1 then
						if chance <= 40 then
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setInt(primed, 0)
							dref.setInt(fire, 0)
						else
							dref.setInt(botched, 1)
						end
					end
					
				end

				
			end
			if dref.getInt(starter_switch) == 3 then --This has 20% chance to start (mag on both) BOTH MAGS
				if dref.getInt(primed) >= 13 then --Burns if overprimed nonetheless
					dref.setInt(burn_baby, 6)
					dref.setInt(fire_partner, 6)
					dref.setInt(primed, 0)
				end
				if dref.getInt(is_warm) == 0 then
					if dref.getInt(primed) < 2 or dref.getInt(primed) > 8 and dref.getInt(primed) < 13 then --MINIMUM PRIME FOR COLD START ON BOTH MAGS
						dref.setInt(mini_botch, 1)
					end
					if dref.getInt(primed) >= 2 and dref.getInt(primed) <= 8 then --This is the correct setting for engine start
						if dref.getInt(new_boy) == 1 then
						dref.setIntV(xdr_ignite, 1, 4)
						dref.setIntV(xdr_ignite, 1, 4)
						dref.setIntV(xdr_ignite, 1, 4)
						dref.setIntV(xdr_ignite, 1, 4)
						dref.setIntV(xdr_ignite, 1, 4)
						dref.setInt(primed, 0)
						dref.setInt(fire, 0)
					elseif	dref.getInt(getting_older) == 1 then
						if chance <= 90 then
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setInt(primed, 0)
							dref.setInt(fire, 0)
						else
							dref.setInt(botched, 1)
							
						end
					elseif dref.getInt(getting_more_older) == 1 then
						if chance <= 80 then
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setInt(primed, 0)
							dref.setInt(fire, 0)
						else
							dref.setInt(botched, 1)
							
						end
					elseif dref.getInt(pretty_beaten) == 1 then
						if chance <= 40 then
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setInt(primed, 0)
							dref.setInt(fire, 0)
						else
							dref.setInt(botched, 1)
						end
						--dref.setInt(trigger, 0)
					end
					end
				else
					if dref.getInt(new_boy) == 1 then
						dref.setIntV(xdr_ignite, 1, 4)
						dref.setIntV(xdr_ignite, 1, 4)
						dref.setIntV(xdr_ignite, 1, 4)
						dref.setIntV(xdr_ignite, 1, 4)
						dref.setIntV(xdr_ignite, 1, 4)
						dref.setInt(primed, 0)
						dref.setInt(fire, 0)
					elseif	dref.getInt(getting_older) == 1 then
						if chance <= 90 then
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setInt(primed, 0)
							dref.setInt(fire, 0)
						else
							dref.setInt(botched, 1)
							
						end
					elseif dref.getInt(getting_more_older) == 1 then
						if chance <= 80 then
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setInt(primed, 0)
							dref.setInt(fire, 0)
						else
							dref.setInt(botched, 1)
							
						end
					elseif dref.getInt(pretty_beaten) == 1 then
						if chance <= 40 then
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setIntV(xdr_ignite, 1, 4)
							dref.setInt(primed, 0)
							dref.setInt(fire, 0)
						else
							dref.setInt(botched, 1)
						end
					end
				end
			end
			if dref.getInt(starter_switch) == 0 then --OFF MAGS
				--dref.setInt(trigger, 0)
				dref.setIntV(xdr_ignite, 1, 4)
				dref.setInt(fire, 0)
				if dref.getInt(primed) > 0 then
					dref.setInt(primed, (dref.getInt(primed)-1))
				end
			end
			
			
		end
	end
	--PISSING
	if dref.getFloat(wobble_psi) >= 3 then
		if dref.getIntV(xdr_engine_on, 1, 1) == 0 then
			dref.setInt(pissing, 1)
		else
			dref.setInt(pissing, 0)
		end
	else
		dref.setInt(pissing, 0)
	end
	
	--Mini botch for when it does nothing
	if dref.getInt(mini_botch) == 1 then
		dref.setInt(mini_botch_partner, 6)
		dref.setInt(mini_botch_partner2, 6)
		dref.setIntV(xdr_ignite, 1, 4)
		dref.setInt(fire, 0)
		dref.setInt(mini_botch, 0)
	end
	
	if dref.getInt(mini_botch) == 0 then
		if dref.getInt(mini_botch_partner) == 6 or dref.getInt(mini_botch_partner2) == 6 then
			if dref.getFloat(time_to_mini_botch) < 0.5 then
				dref.setFloat(time_to_mini_botch, (dref.getFloat(time_to_mini_botch) + dref.getFloat(time)))
			else
				if dref.getFloat(time_to_mini_botch) >= 0.5 then
					dref.setInt(mini_botch_partner, 0)
					dref.setInt(mini_botch_partner2, 0)
					dref.setFloat(time_to_mini_botch, 0)
				end
			end
		end
	end	
	
--When it kinda fails to start (botches)
	if dref.getInt(botched) == 1 then
	dref.setFloat(time_to_botch, (dref.getFloat(time_to_botch) + dref.getFloat(time)))
		if dref.getFloat(time_to_botch) <= 0.4 then
			dref.setIntV(xdr_ignite, 1, 4)
			dref.setIntV(xdr_ignite, 1, 4)
			dref.setIntV(xdr_ignite, 1, 4)
			dref.setInt(primed, 0)
			dref.setInt(fire, 0)
			--dref.setInt(trigger, 0)
		else
			if dref.getFloat(time_to_botch) > 1 then
				dref.setInt(botched_fail, 6)
				
			end
			if dref.getFloat(time_to_botch) >= 4 then
				dref.setInt(botched_fail, 0)
				dref.setInt(botched, 0)
			end
		end
	end
	
	if dref.getInt(botched) == 0 then
		dref.setFloat(time_to_botch, 0)
	end
	
-------------Coupled Magneto Behaviour
	
--[[if dref.getIntV(xdr_engine_on, 1, 1) == 0 then
		if dref.getInt(starter_switch) ~= 2 then
			dref.setIntV(xdr_starter_actual, 1, 0)
		end
	end
--]]	

	--dref.set(reduced_crank, (dref.getFloat(crank_deg)/4))
	if dref.getFloat(oil_in_line) < 0 then
		dref.setFloat(oil_in_line, 0)
	end
	
	if dref.getFloat(crank_deg) == 359 then
		
		dref.setFloat(crank_deg, 0)
		if dref.getInt(trigger) == 0 then
			dref.setInt(trigger, 1)
			if dref.getFloat(oil_in_line) > 0 then
				dref.setFloat(oil_in_line, (dref.getFloat(oil_in_line) - 0.5))
			end
		else 
			dref.setInt(fire, 1)
			dref.setInt(trigger, 0)
		end
	end
	
	if dref.getInt(starter_switch) == 0 then
			dref.setIntV(xdr_starter_actual, 1, 0)
		
	end

	if dref.getInt(starter_switch) == 1 then
		--if dref.getIntV(xdr_ignite, 1, 1) ~= 4 then
			if dref.getInt(wobble_ok) == 1 then
				dref.setIntV(xdr_starter_actual, 1, 2)
			else
				dref.setIntV(xdr_starter_actual, 1, 0)
			end
		--end
		
	end

	if dref.getInt(starter_switch) == 2 then
		--if dref.getIntV(xdr_ignite, 1, 1) ~= 4 then
			if dref.getInt(wobble_ok) == 1 then
				dref.setIntV(xdr_starter_actual, 1, 1)
				else
				dref.setIntV(xdr_starter_actual, 1, 0)
			end
		--end
	end

	if dref.getInt(starter_switch) == 3 then
		--if dref.getIntV(xdr_ignite, 1, 1) ~= 4 then
			if dref.getInt(wobble_ok) == 1 then
				dref.setIntV(xdr_starter_actual, 1, 3)
			else
				dref.setIntV(xdr_starter_actual, 1, 0)
			end
		--end
	end
	
	
	
	
	
	
	
	
--[[	if dref.getFloat(crank_deg) > 168 and dref.getFloat(crank_deg) <= 175 then
		dref.setInt(fire, 1)
	end
--]]	
-- Fuel Tank Selector
	
	if dref.getInt(control_fuel) == 0 or dref.getInt(control_fuel) == 3 then
		dref.setInt(actual_fuel_tank, 0)
	end
	
	if dref.getInt(control_fuel) == 1 then
		dref.setInt(actual_fuel_tank, 1)
	end
	
	if dref.getInt(control_fuel) == 2 then
		dref.setInt(actual_fuel_tank, 3)
	end
		
	
	
	--Wobble Pump Firing timer for pressure decay
	
	if dref.getIntV(xdr_engine_on, 1, 1) == 0 then
		if dref.getFloat(wobble_psi) > 0 then
			if dref.getFloat(wobble_decay) <= 1 then
				dref.setFloat(wobble_decay, (dref.getFloat(wobble_decay)+dref.getFloat(time)))
			else
				dref.setFloat(wobble_decay, 0)
	
			end
		end
	else
		dref.setFloat(wobble_decay, 0)
	end
	
	
--Wobble Pump Logic

	if dref.getFloat(wobble) <= 0.3 then
		dref.setInt(can_pump, 1)
	end
	
	if dref.getFloat(wobble) >=0.8 then
		if dref.getInt(can_pump) == 1 then
			dref.setInt(pumped, 1)
			dref.setInt(can_pump, 0)
		end
	end
	
	if dref.getInt(pumped) == 1 then
		if dref.getInt(control_fuel) ~= 0 and dref.getInt(control_fuel) ~= 3 then
			if dref.getFloat(wobble_psi) < 3.5 then
				dref.setFloat(wobble_psi, (dref.getFloat(wobble_psi)+0.15))
				dref.setInt(pumped, 0)
			end
		end
	end
	
	if dref.getFloat(wobble_psi) >= 2 then
		dref.setInt(wobble_ok, 1)
	else
		dref.setInt(wobble_ok, 0)
	end
	


-- Wobble Pump Decay happening
	
	if dref.getFloat(wobble_decay) >= 0.7 then
		if dref.getFloat(wobble_psi) >= 0  and dref.getFloat(wobble_psi) <= 5 then
			dref.setFloat(wobble_psi, (dref.getFloat(wobble_psi)-0.001))
		end
	end
	
	if dref.getFloat(wobble_decay) >= 0.3 then
		if dref.getFloat(wobble_psi) >= 7 then
			dref.setFloat(wobble_psi, (dref.getFloat(wobble_psi)-0.01))
		end
	end
	
--Reduces maximum pressure after engine start	

	if dref.getIntV(xdr_engine_on, 1, 1) == 1 then
		
		if dref.getFloat(wobble_psi) > 2.5 then
			dref.setFloat(wobble_decay, (dref.getFloat(wobble_decay)+dref.getFloat(time)))
		else
			dref.setFloat(wobble_decay, 0)
		end
		if dref.getFloat(oil_tick) >= 5 then
			dref.setInt(engine_can_lock, 1)
		end
	end
	
--Setting engine hydrolocking chance
	
local var = math.random(0,100)
	
	
------------------Hydrolock Routine Check
	if dref.getFloat(oil_pool) >= 3.5 and dref.getInt(engine_can_lock) == 1 then
		if var >= 5 then
			dref.setInt(engine_is_hydrolocked, 0)
			dref.setInt(engine_can_lock, 0)
		else
			dref.setInt(engine_is_hydrolocked, 1)
			dref.setInt(engine_can_lock, 0)
		end
	end
--[[So When the engine gets hydrolocked, it hasn't failed YET. It will trigger the "caut" warning on maintenance.
If you try to spin it, it will be hard to prop it. If one props it even once, it will trigger "rod_is_bent" which will reduce power drastically and start running the catastrophic failure.
Once a minute with 1%  chance we will run catastrophic failure checks. When it hits, the shaft separates from the prop, and a rough and accelerated noise is heard. Engine has been lost at this point. 	
--]]
	

	
	
	
-----------Instrument Logic

---We insert our oil press indication problems here
	
	if dref.getFloat(our_oil) <= 6  and dref.getIntV(xdr_engine_on, 1, 1) == 1 then
		dref.setInt(oil_pressure_fail, 6)
	end
	
	
	if dref.getInt(oil_pressure_fail) == 6 or dref.getIntV(xdr_engine_on, 1, 1) == 0 then
		if dref.getFloat(oil_press) > 0 then
			if dref.getFloat(time) >= 0 then
				dref.setFloat(oil_press, dref.getFloat(oil_press) - 0.04)
			end
		end	
	else
		dref.setFloat(oil_press, (dref.getFloatV(xdr_oil_press_actual, 1, 1) - 40))
	
	end
	
if dref.getFloat(air_filter_status) == 0  then
	if dref.getIntV(xdr_engine_on, 1, 1) == 1 then
		dref.setFloat(oil_temp, (dref.getFloat(oil_temp)+(dref.getFloat(time)/3)))
		dref.setInt(warmup_consequence, 6)
	end
end

if dref.getInt(oil_filter_status) == 0  then
	if dref.getIntV(xdr_engine_on, 1, 1) == 1 then
		dref.setFloat(oil_temp, (dref.getFloat(oil_temp)+(dref.getFloat(time)/3)))
	end
end
	

--Oil Temps
	if dref.getInt(engine_covers) == 0 then
		
		if dref.getFloat(oil_age) > 2.5 and dref.getFloat(oil_age) <= 5 then
			if dref.getFloat(oil_temp) >= (dref.getFloatV(xdr_oil_temp_actual, 1, 1)/3.6) then
				dref.setFloat(oil_temp, (dref.getFloat(oil_temp)-dref.getFloat(time)/1.5))
			elseif dref.getFloat(oil_temp) < (dref.getFloatV(xdr_oil_temp_actual, 1, 1)/3.6) then
				dref.setFloat(oil_temp, (dref.getFloat(oil_temp)+dref.getFloat(time)/1.5))
			end
			--dref.setFloat(oil_temp, (dref.getFloatV(xdr_oil_temp_actual, 1, 1)/3.6))
		elseif dref.getFloat(oil_age) > 5 and dref.getFloat(oil_age) <= 7.5 then
			if dref.getFloat(oil_temp) >= (dref.getFloatV(xdr_oil_temp_actual, 1, 1)/3.3) then
				dref.setFloat(oil_temp, (dref.getFloat(oil_temp)-dref.getFloat(time)/1.5))
			elseif dref.getFloat(oil_temp) < (dref.getFloatV(xdr_oil_temp_actual, 1, 1)/3.3) then
				dref.setFloat(oil_temp, (dref.getFloat(oil_temp)+dref.getFloat(time)/1.5))
			end
			--dref.setFloat(oil_temp, (dref.getFloatV(xdr_oil_temp_actual, 1, 1)/3.3))
		elseif dref.getFloat(oil_age) > 7.5 then
			if dref.getFloat(oil_temp) >= (dref.getFloatV(xdr_oil_temp_actual, 1, 1)/3) then
				dref.setFloat(oil_temp, (dref.getFloat(oil_temp)-dref.getFloat(time)/1.5))
			elseif dref.getFloat(oil_temp) < (dref.getFloatV(xdr_oil_temp_actual, 1, 1)/3) then
				dref.setFloat(oil_temp, (dref.getFloat(oil_temp)+dref.getFloat(time)/1.5))
			end
			--dref.setFloat(oil_temp, (dref.getFloatV(xdr_oil_temp_actual, 1, 1)/3))
		else
			if dref.getFloat(oil_temp) >= (dref.getFloatV(xdr_oil_temp_actual, 1, 1)/3.8) then
				dref.setFloat(oil_temp, (dref.getFloat(oil_temp)-dref.getFloat(time)/1.5))
			elseif dref.getFloat(oil_temp) < (dref.getFloatV(xdr_oil_temp_actual, 1, 1)/3.8) then
				dref.setFloat(oil_temp, (dref.getFloat(oil_temp)+dref.getFloat(time)/1.5))
			end
			--dref.setFloat(oil_temp, (dref.getFloatV(xdr_oil_temp_actual, 1, 1)/3.8))
		end
		if dref.getInt(on_ground) == 1 and dref.getIntV(xdr_engine_on, 1, 1) == 1 then
			if dref.getInt(we_cooling) == 0 then
				dref.setFloat(oil_temp, (dref.getFloat(oil_temp)+dref.getFloat(time)/3))
				dref.setFloatV(xdr_oil_temp_actual, 1, (dref.getFloatV(xdr_oil_temp_actual, 1, 1)+dref.getFloat(time)/3))
			end
		end
	else
		if dref.getFloat(oil_temp) >= (dref.getFloatV(xdr_oil_temp_actual, 1, 1)/3.8) then
				dref.setFloat(oil_temp, (dref.getFloat(oil_temp)-dref.getFloat(time)/1.5))
			elseif dref.getFloat(oil_temp) < (dref.getFloatV(xdr_oil_temp_actual, 1, 1)/3.8) then
				dref.setFloat(oil_temp, (dref.getFloat(oil_temp)+dref.getFloat(time)/1.5))
			end
		--dref.setFloat(oil_temp, (dref.getFloatV(xdr_oil_temp_actual, 1, 1)/3.8))
		if dref.getIntV(xdr_engine_on, 1, 1) == 1 then
			dref.setFloat(oil_temp, (dref.getFloat(oil_temp)+dref.getFloat(time)))
			dref.setFloatV(xdr_oil_temp_actual, 1, (dref.getFloatV(xdr_oil_temp_actual, 1, 1)+dref.getFloat(time)))
		end
	end
--Chocks
	if dref.getInt(chocks_on) == 1 then
		dref.setFloat(chocks_brake, 1)
	end
	
--Warmup Logic
	
	if dref.getIntV(xdr_engine_on, 1, 1) == 0 then
		if dref.getInt(is_warm) == 0 then
			dref.setInt(warmup_can_fail, 1)
		end
	end
	
	if dref.getInt(is_warm) == 0 then
		if dref.getIntV(xdr_engine_on, 1, 1) == 1 then
			if dref.getFloat(time_to_warm) <= 30 then
				dref.setFloat(time_to_warm, (dref.getFloat(time_to_warm)+dref.getFloat(time)))
			end
		else
			dref.setFloat(time_to_warm, 0)
		end
	else
		dref.setFloat(time_to_warm, 0)
	end
	
----------EXCLUI ISSO AGORA	
	
--[[	if dref.getFloat(time_to_warm) >= 29 then
		dref.setInt(is_warm, 1)
		dref.setFloat(time_to_warm, 0)
	end
--]]
	
	
	
	if dref.getFloatV(xdr_oil_temp_actual, 1, 1) <= 120 then
		dref.setInt(is_warm, 0)
	else
		dref.setInt(is_warm, 1)
	end
	
	if dref.getFloatV(xdr_RPM, 1, 1) >= 1200 then
		if dref.getInt(warmup_can_fail) == 1 then
			if dref.getInt(is_warm) == 0 then
			dref.setInt(warmup_fail, (dref.getInt(warmup_fail)+1))
			dref.setInt(warmup_can_fail, 0)
			end
		end
	end
	
	if dref.getInt(warmup_fail) >= 6 then
		if dref.getIntV(xdr_engine_on, 1, 1) == 1 then
			dref.setFloatV(xdr_oil_temp_actual, 1, (dref.getFloatV(xdr_oil_temp_actual,1,1) + (dref.getFloat(time)*1.3)))
			if chance > 99.98 then
				dref.setInt(warmup_consequence, 6)
				dref.setInt(rattling_hard, 1)
			end
		end
	end
	
	
	

	
--Oil Consumption
	if dref.getFloat(oil_age) > 10 then
		dref.setFloat(oil_age, 10)
	end
	
	if dref.getIntV(xdr_engine_on, 1, 1) == 1 then
		if dref.getFloat(oil_tick) <= 60 then
			dref.setFloat(oil_tick, (dref.getFloat(oil_tick)+dref.getFloat(time)))
			--dref.set(baffle_life, (dref.get(baffle_life)-dref.getFloat(time))) --TRIGGERS OUR BAFFLE STATUS
			
		else
			dref.setFloat(oil_age, (dref.getFloat(oil_age)+ 0.03125))
			if dref.getInt(oil_filter_status) > 0 then
				dref.setInt(oil_filter_status, (dref.getInt(oil_filter_status)-1))
			end
			if dref.getFloat(air_filter_status) > 0 then
				dref.setFloat(air_filter_status, (dref.getFloat(air_filter_status)-1))
			end
			dref.setInt(my_age, (dref.getInt(my_age)+1)) --TRUEVINTAGE WAS DISABLED FOR 2ND TEST BUILD!!!
			dref.setFloat(oil_tick, 0)
			if dref.getInt(on_ground) == 0 then
				if dref.getFloat(latitude) <= 60 and dref.getFloat(latitude) >= -60 then
					if chance >= 97 then
						dref.setInt(bugged, 1)
					end
				end
			end
			
			
			
			
			
		end
	else
		dref.setFloat(oil_tick, 0)
		--[[Using this to cool down our engine
		if dref.getFloat(oil_temp) > dref.getFloat(outside_temperature) then
			dref.setFloatV(xdr_oil_temp_actual, 1, (dref.getFloatV(xdr_oil_temp_actual, 1, 1)-(dref.getFloat(time)/5)))
		end
		--]]
	end
	
	if dref.getFloat(oil_temp) >= 100 then
		if dref.getInt(warmup_fail) <= 6 then
			dref.setInt(warmup_fail, (dref.getInt(warmup_fail)+1))
			dref.setInt(oil_pressure_fail, 6)
		
		else
		dref.setInt(oil_pressure_fail, 6)
		end
	end
	
	if dref.getFloat(oil_tick) > 59 and dref.getFloat(oil_tick) < 59.1 then
		dref.setFloat(our_oil, (dref.getFloat(our_oil)-0.006))
		dref.setFloatV(xdr_oilquan, 1, (dref.getFloatV(xdr_oilquan, 1, 1)-0.00043))
	end
	
	
	
	
	if dref.getIntV(xdr_engine_on, 1, 1) == 0 then
		if dref.getFloat(oil_pool) <= 4 then
			if dref.getFloat(oil_buildup) <= 60 then
				dref.setFloat(oil_buildup, (dref.getFloat(oil_buildup)+dref.getFloat(time)))
			else
				dref.setFloat(oil_buildup, 0)
			end
		end
	else
		dref.setFloat(oil_buildup, 0)
	end
	
	if dref.getFloat(oil_buildup) > 59 and dref.getFloat(oil_buildup) < 59.01 then
		if dref.getFloat(oil_pool) < 3.5 then
			if dref.getInt(is_warm) == 0 then
		--dref.setInt(oil_can_build, 1)
		--dref.setInt(oil_can_build, 0)
				dref.setFloat(oil_pool, (dref.getFloat(oil_pool)+0.1))
				dref.setFloat(our_oil, (dref.getFloat(our_oil)-0.003))
				dref.setFloatV(xdr_oilquan, 1, (dref.getFloatV(xdr_oilquan, 1, 1)-0.00021))
			end
			if dref.getInt(is_warm) == 1 then
				dref.setFloat(oil_pool, (dref.getFloat(oil_pool)+0.2))
				dref.setFloatV(xdr_oilquan, 1, (dref.getFloatV(xdr_oilquan, 1, 1)-0.00043))
				dref.setFloat(our_oil, (dref.getFloat(our_oil)-0.006))
			end
		end
	end
--[[Oil Buildup




	
	if dref.getIntV(xdr_engine_on, 1, 1) == 0 then
		if dref.getFloat(oil_pool) <= 4 then
		
			if dref.getFloat(oil_buildup) <= 60 then
				dref.setFloat(oil_buildup, (dref.getFloat(oil_buildup)+dref.getFloat(time)))
				dref.setInt(oil_can_build, 0)
			
			else
				
				dref.setFloat(oil_buildup, 0)
			end
			
		end
		
		
	else
		dref.setFloat(oil_buildup, 0)
		dref.setInt(oil_can_build, 0)
	end
	
	if dref.getFloat(oil_buildup) >= 59 and dref.getFloat(oil_buildup) <= 59.2 then
		dref.setInt(oil_can_build, 1)
	
	else
		dref.setInt(oil_can_build, 0)
	end
--]]	
	
	
	--[[DEPRECATEDEngine temperature affects oil buildup
	if dref.getFloat(oil_buildup) > 59.9 then
		if dref.getInt(is_warm) == 1 then
		dref.setFloat(oil_pool, (dref.getFloat(oil_pool)+0.3))
		elseif dref.getInt(is_warm) == 0 then
			dref.setFloat(oil_pool, (dref.getFloat(oil_pool)+0.1))
		end
		
	end--]]
	if dref.getInt(oil_can_build) == 1 then
		if dref.getInt(is_warm) == 1 then
			--if dref.getFloat(oil_buildup) > 59 and dref.getFloat(oil_buildup) < 59.1 then
				dref.setFloat(oil_pool, (dref.getFloat(oil_pool)+0.3))
				dref.setFloatV(xdr_oilquan, 1, (dref.getFloatV(xdr_oilquan, 1, 1)-0.00043))
				dref.setFloat(our_oil, (dref.getFloat(our_oil)-0.006))
			--end
		end
		if dref.getInt(is_warm) == 0 then
			--if dref.getFloat(oil_buildup) > 59 and dref.getFloat(oil_buildup) < 59.1 then
				dref.setFloat(oil_pool, (dref.getFloat(oil_pool)+0.1))
				dref.setFloat(our_oil, (dref.getFloat(our_oil)-0.003))
				dref.setFloatV(xdr_oilquan, 1, (dref.getFloatV(xdr_oilquan, 1, 1)-0.00021))
			--end
		end
		
	end

	--Starter own timer
	
	if dref.getInt(smoking) == 1 then
		dref.setInt(smokey_killer, 0)
	else
		dref.setInt(smokey_killer, 1)
	end
		
	if dref.getIntV(xdr_engine_on, 1, 1) == 1 then
		if dref.getFloat(oil_pool) >= 3.4 then --This controls our oil burn runmodes, actually
			if dref.getInt(start_runmode) <= 8 then
				if dref.getFloat(start_time) <= 0.7 then
					dref.setFloat(start_time, (dref.getFloat(start_time)+dref.getFloat(time)))
				else
					dref.setFloat(start_time, 0)
					
				end
			end
			if dref.getInt(start_runmode) == 8 then
				dref.setFloat(oil_pool, 0)
				dref.setFloat(start_time, 0)
				dref.setInt(smoking, 0)
			end
		end
		if dref.getFloat(oil_pool) < 3 and dref.getFloat(oil_pool) >=2 then --Oil burnup logic for medium oil pool
			if dref.getInt(start_runmode) <= 6 then
				if dref.getFloat(start_time) <= 0.7 then
					dref.setFloat(start_time, (dref.getFloat(start_time)+dref.getFloat(time)))
				else
					dref.setFloat(start_time, 0)
					
				end
			end
			if dref.getInt(start_runmode) == 6 then
				dref.setFloat(oil_pool, 0)
				dref.setFloat(start_time, 0)
				dref.setInt(smoking, 0)
			end
		end
		if dref.getFloat(oil_pool) < 2 then --Oil burnup logic for low oil pool
			if dref.getInt(start_runmode) <= 3 then
				if dref.getFloat(start_time) <= 0.7 then
					dref.setFloat(start_time, (dref.getFloat(start_time)+dref.getFloat(time)))
				else
					dref.setFloat(start_time, 0)
					
				end
			end
			if dref.getInt(start_runmode) == 3 then
				dref.setFloat(oil_pool, 0)
				dref.setFloat(start_time, 0)
				dref.setInt(smoking, 0)
			end
		end
	end
		
--Starter and Oil burner logic for full (4/4) oil on Cylinder

	if dref.getIntV(xdr_engine_on, 1, 1) == 1 then --Our Q to reset start_runmode in case this is off!
		if dref.getInt(start_runmode) < 2 then --The runmode loop. Make sure to close it on THIS ELSE
			--if dref.getFloat(oil_pool) >= 4 then --This is where we can dref.set different oil burnups for different oil levels on cylinder (1/4, 2/4.. so on)
				if dref.getFloat(start_time) > 0 and dref.getFloat(start_time) < 0.05 then
					dref.setInt(s1, 1)
					dref.setInt(smoking, 1)
				else
					dref.setInt(s1,0)
					
				end
				if dref.getFloat(start_time) >= 0.05 and dref.getFloat(start_time) < 0.1 then
					dref.setInt(s2, 1)
					dref.setInt(smoking, 1)
				else
					dref.setInt(s2, 0)
					
				end
				if dref.getFloat(start_time) >= 0.1 and dref.getFloat(start_time) < 0.15 then
					dref.setInt(s3, 1)
					dref.setInt(smoking, 1)
				else
					dref.setInt(s3, 0)
					
				end
				if dref.getFloat(start_time) >= 0.3 and dref.getFloat(start_time) < 0.35 then
					dref.setInt(s4, 1)
					dref.setInt(smoking, 1)
				else
					dref.setInt(s4, 0)
					
				end
				if dref.getFloat(start_time) >= 0.35 and dref.getFloat(start_time) < 0.4 then
					dref.setInt(s4, 1)
					dref.setInt(smoking, 1)
				else
					dref.setInt(s4, 0)
					dref.setInt(smoking, 0)
				end
				if dref.getFloat(start_time) >= 0.4 and dref.getFloat(start_time) < 0.45 then
					dref.setInt(s5, 1)
					dref.setInt(smoking, 1)
				else
					dref.setInt(s5, 0)
					dref.setInt(smoking, 0)
				end
				if dref.getFloat(start_time) >= 0.45 and dref.getFloat(start_time) < 0.5 then
					dref.setInt(s6, 1)
					dref.setInt(smoking, 1)
				else
					dref.setInt(s6, 0)
					dref.setInt(smoking, 0)
				end
				if dref.getFloat(start_time) >= 0.55 and dref.getFloat(start_time) < 0.6 then
					dref.setInt(s7, 1)
					dref.setInt(smoking, 1)
				else
					dref.setInt(s7, 0)
					dref.setInt(smoking, 0)
				end
				if dref.getFloat(start_time) >= 0.6 and dref.getFloat(start_time) < 0.65 then
					dref.setInt(s8, 1)
					dref.setInt(smoking, 1)
				else
					dref.setInt(s8, 0)
					dref.setInt(smoking, 0)
				end
				if dref.getFloat(start_time) >= 0.65 and dref.getFloat(start_time) < 0.7 then
					dref.setInt(s9, 1)
					dref.setInt(smoking, 1)
				else
					dref.setInt(s9, 0)
					dref.setInt(smoking, 0)
				end
				if dref.getFloat(start_time) >= 0.7 then	
					dref.setInt(start_runmode, (dref.getInt(start_runmode)+1))
					
				end
			--end
			
		end	
			
			
			
			
		if dref.getInt(start_runmode) >= 2 and dref.getInt(start_runmode) <= 6 then --The runmode loop. Make sure to close it on THIS ELSE
			--if dref.getFloat(oil_pool) >= 4 then
				if dref.getFloat(start_time) > 0 and dref.getFloat(start_time) < 0.05 then
					dref.setInt(s1, 1)
					dref.setInt(smoking, 1)
				else
					dref.setInt(s1,0)
					
				end
				if dref.getFloat(start_time) >= 0.05 and dref.getFloat(start_time) < 0.1 then
					dref.setInt(s2, 1)
					dref.setInt(smoking, 1)
				else
					dref.setInt(s2, 0)
					
				end
				if dref.getFloat(start_time) >= 0.1 and dref.getFloat(start_time) < 0.15 then
					dref.setInt(s3, 1)
					dref.setInt(smoking, 1)
				else
					dref.setInt(s3, 0)
					
				end
				if dref.getFloat(start_time) >= 0.15 and dref.getFloat(start_time) < 0.2 then
					dref.setInt(s4, 1)
					dref.setInt(smoking, 1)
				else
					dref.setInt(s4, 0)
					
				end
				if dref.getFloat(start_time) >= 0.2 and dref.getFloat(start_time) < 0.25 then
					dref.setInt(s4, 1)
					dref.setInt(smoking, 1)
				else
					dref.setInt(s4, 0)
					
				end
				if dref.getFloat(start_time) >= 0.25 and dref.getFloat(start_time) < 0.3 then
					dref.setInt(s5, 1)
					dref.setInt(smoking, 1)
				else
					dref.setInt(s5, 0)
					
				end
				if dref.getFloat(start_time) >= 0.3 and dref.getFloat(start_time) < 0.35 then
					dref.setInt(s6, 1)
					dref.setInt(smoking, 1)
				else
					dref.setInt(s6, 0)
					
				end
				if dref.getFloat(start_time) >= 0.35 and dref.getFloat(start_time) < 0.4 then
					dref.setInt(s7, 1)
					dref.setInt(smoking, 1)
				else
					dref.setInt(s7, 0)
					
				end
				if dref.getFloat(start_time) >= 0.4 and dref.getFloat(start_time) < 0.45 then
					dref.setInt(s8, 1)
					dref.setInt(smoking, 1)
				else
					dref.setInt(s8, 0)
					
				end
				if dref.getFloat(start_time) >= 0.45 and dref.getFloat(start_time) < 0.5 then
					dref.setInt(s9, 1)
					dref.setInt(smoking, 1)
				else
					dref.setInt(s9, 0)
					
				end
				if dref.getFloat(start_time) >= 0.6999 then	
					dref.setInt(start_runmode, (dref.getInt(start_runmode)+1))
				end
			--end
		end
		
		
		
		if dref.getInt(start_runmode) > 6 and dref.getInt(start_runmode) <= 8 then --The runmode loop. Make sure to close it on THIS ELSE
			--if dref.getFloat(oil_pool) >= 4 then
				if dref.getFloat(start_time) > 0 and dref.getFloat(start_time) < 0.05 then
					dref.setInt(s1, 1)
					dref.setInt(smoking, 1)
				else
					dref.setInt(s1,0)
					dref.setInt(smoking, 0)
				end
				if dref.getFloat(start_time) >= 0.05 and dref.getFloat(start_time) < 0.1 then
					dref.setInt(s2, 1)
					dref.setInt(smoking, 1)
				else
					dref.setInt(s2, 0)
					dref.setInt(smoking, 0)
				end
				if dref.getFloat(start_time) >= 0.1 and dref.getFloat(start_time) < 0.15 then
					dref.setInt(s3, 1)
					dref.setInt(smoking, 1)
				else
					dref.setInt(s3, 0)
					dref.setInt(smoking, 0)
				end
				if dref.getFloat(start_time) >= 0.3 and dref.getFloat(start_time) < 0.35 then
					dref.setInt(s4, 1)
					dref.setInt(smoking, 1)
				else
					dref.setInt(s4, 0)
					dref.setInt(smoking, 0)
				end
				if dref.getFloat(start_time) >= 0.35 and dref.getFloat(start_time) < 0.4 then
					dref.setInt(s4, 1)
					dref.setInt(smoking, 1)
				else
					dref.setInt(s4, 0)
					dref.setInt(smoking, 0)
				end
				if dref.getFloat(start_time) >= 0.4 and dref.getFloat(start_time) < 0.45 then
					dref.setInt(s5, 1)
					dref.setInt(smoking, 1)
				else
					dref.setInt(s5, 0)
					dref.setInt(smoking, 0)
				end
				if dref.getFloat(start_time) >= 0.45 and dref.getFloat(start_time) < 0.5 then
					dref.setInt(s6, 1)
					dref.setInt(smoking, 1)
				else
					dref.setInt(s6, 0)
					dref.setInt(smoking, 0)
				end
				if dref.getFloat(start_time) >= 0.55 and dref.getFloat(start_time) < 0.6 then
					dref.setInt(s7, 1)
					dref.setInt(smoking, 1)
				else
					dref.setInt(s7, 0)
					dref.setInt(smoking, 0)
				end
				if dref.getFloat(start_time) >= 0.6 and dref.getFloat(start_time) < 0.65 then
					dref.setInt(s8, 1)
					dref.setInt(smoking, 1)
				else
					dref.setInt(s8, 0)
					dref.setInt(smoking, 0)
				end
				if dref.getFloat(start_time) >= 0.65 and dref.getFloat(start_time) < 0.7 then
					dref.setInt(s9, 1)
					dref.setInt(smoking, 1)
				else
					dref.setInt(s9, 0)
					dref.setInt(smoking, 0)
				end
				if dref.getFloat(start_time) >= 0.7 then	
					dref.setInt(start_runmode, (dref.getInt(start_runmode)+1))
				end
			--end
		end
		
	else
		dref.setInt(start_runmode, 0)
		dref.setInt(smoking, 0)
		dref.setInt(s1, 0)
		dref.setInt(s2, 0)
		dref.setInt(s3, 0)
		dref.setInt(s4, 0)
		dref.setInt(s5, 0)
		dref.setInt(s6, 0)
		dref.setInt(s7, 0)
		dref.setInt(s8, 0)
		dref.setInt(s9, 0)
	end
	
	
	--[[Stopping the sprites
	if dref.getInt(s1) == 1 then
		dref.setInt(s1, 0)
	end
	if dref.getInt(s2) == 1 then
		dref.setInt(s2, 0)
	end
	if dref.getInt(s3) == 1 then
		dref.setInt(s3, 0)
	end
	--]]
end















