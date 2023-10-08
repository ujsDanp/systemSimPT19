function menuwork()

	------------MENU STARTS HERE
	---MAIN MENU
	if dref.getInt(menu_page) == 0 then
		dref.setInt(mainm_show, 1)
		dref.setInt(engine_show, 0)
		dref.setInt(airframe_show, 0)
		dref.setInt(ass_show, 0)
		dref.setInt(oil_show, 0)
	end
	---ENGINE PAGE
	if dref.getInt(menu_page) == 1 then
		dref.setInt(mainm_show, 0)
		dref.setInt(engine_show, 1)
		dref.setInt(airframe_show, 0)
		dref.setInt(ass_show, 0)
		dref.setInt(oil_show, 0)
	end

	if dref.getInt(menu_page) == 2 then
		dref.setInt(mainm_show, 0)
		dref.setInt(engine_show, 0)
		dref.setInt(airframe_show, 0)
		dref.setInt(ass_show, 0)
		dref.setInt(oil_show, 1)
	end

	if dref.getInt(menu_page) == 3 then
		dref.setInt(mainm_show, 0)
		dref.setInt(engine_show, 0)
		dref.setInt(airframe_show, 1)
		dref.setInt(ass_show, 0)
		dref.setInt(oil_show, 0)
	end

	if dref.getInt(menu_page) == 4 then
		dref.setInt(mainm_show, 0)
		dref.setInt(engine_show, 0)
		dref.setInt(airframe_show, 0)
		dref.setInt(ass_show, 1)
		dref.setInt(oil_show, 0)
	end

	if dref.getInt(on_ground) == 0 then
		dref.setInt(menu, 0)
	end

	if dref.getInt(menu) == 0 then
		dref.setInt(go_menu, 1)
		dref.setInt(mainm_show, 0)
		dref.setInt(oil_show, 0)
		dref.setInt(airframe_show, 0)
		dref.setInt(ass_show, 0)
	end

	if dref.getInt(menu) == 1 and dref.getInt(go_menu) == 1 then
		dref.setInt(menu_page, 0)
		dref.setInt(go_menu, 0)
	end




	------------------------FAILURES

	local bcheck = math.random(0,100)


	--Hydrolock

	if dref.getInt(rod_is_bent) == 1 then
		dref.setInt(warmup_consequence, 6)
		if dref.getFloat(oil_tick) >=60 then
			if bcheck <= 4.5 then
				dref.setInt(engine_broken_consequence, 6)
			end
		end
	end


	if dref.getIntV(xdr_ignite, 1, 1) == 4 then
		if dref.getInt(engine_is_hydrolocked) == 1 then
			dref.setInt(rod_is_bent, 1)
		end
	end




	if dref.getFloat(oil_tick) >=60 then
		if bcheck <= 4.5 then
			if dref.getInt(rod_is_bent) == 1 then
				dref.setInt(engine_broken_consequence, 6)
			end
		end
	end




	--Engine Timer for animations

	if dref.getFloat(engine_timer) <= 1 then
		if dref.getInt(report_hydro) == 0 and dref.getInt(report_seized) == 0 then
			if dref.getInt(report_bent) == 0 then
				dref.setFloat(engine_timer, (dref.getFloat(engine_timer)+dref.getFloat(time)))
			else
				dref.setFloat(engine_timer, 0)
			end
		else
			dref.setFloat(engine_timer, 0)
		end	
	else
		dref.setFloat(engine_timer, 0)
	end

	--Advanced Animations

	if dref.getFloat(engine_timer) >= 0 and dref.getFloat(engine_timer) < 0.25 or dref.getFloat(engine_timer) >= 0.5 and dref.getFloat(engine_timer) < 0.75 then
		dref.setInt(rod_animator, 1)
	else
		dref.setInt(rod_animator, 0)
	end


	--------------Once we begin entering the menus...


	-----------PREF SETTINGS
	if dref.getInt(disable_truevintage) == 1 then
		dref.setInt(my_age, 0)
	end

	if dref.getInt(tires_serviced) == 1 then
		dref.setInt(llanding_count, 0)
		dref.setInt(rlanding_count, 0)
		dref.setInt(ltire_burst, 0)
		dref.setInt(rtire_burst, 0)
		dref.setInt(tires_serviced, 0)
	end

	if dref.getInt(autostart_on) == 1 then
		dref.setInt(engine_covers, 0)
		dref.setInt(velas_on, 1)
		dref.setInt(oil_filled, 1)
		dref.setInt(primed, 6)
		dref.setInt(engine_repaired, 1)
		dref.setInt(strainer_repaired, 1)
		dref.setInt(oil_filled, 0)
		dref.setInt(engine_repaired, 0)
		dref.setInt(strainer_repaired, 0)
		dref.setFloat(wobble_psi, 3)
		dref.setInt(starter_switch, 2)
		dref.setInt(control_fuel, 1)
		dref.setFloatV(xdr_throttle_ratio, 1, 0.1)
		dref.setFloatV(xdr_mixture_ratio, 1, 1)
		if dref.getFloatV(xdr_RPM, 1, 1) < 400 then
			dref.setIntV(xdr_ignite, 1, 4)
		else
			dref.setInt(autostart_on, 0)
		end
	end

	if dref.getInt(strainer_repaired) == 1 then
		dref.setFloat(strainer_time, 0)
	end
		


	------------------ENGINE MENU 


	--Engine_repaired has to clean warmup_consequence, warmup_fail, and dref.set engine_status back to 2


	if dref.getInt(engine_repaired) == 1 then
		dref.setFloat(y_drain, 0)
		dref.setFloat(oil_age, 0)
		dref.setInt(burn_baby, 0)
		dref.setInt(fire_partner, 0)
		dref.setInt(disparo, 0)
		dref.setInt(prop_strike, 0)
		dref.setFloatV(xdr_oil_temp_actual, 1, 70)
		dref.setFloat(oil_temp, 20)
		dref.setFloat(our_oil, 15)
		dref.setFloatV(xdr_oilquan, 1, 0.85)
		dref.setInt(oil_pressure_fail, 0)
		dref.setInt(warmup_fail, 0)
		dref.setInt(warmup_consequence, 0)
		dref.setInt(engine_is_hydrolocked, 0)
		dref.setInt(rod_is_bent, 0)
		dref.setInt(engine_broken_consequence, 0)
		dref.setInt(engine_status, 2)
		dref.setFloat(oil_pool, 0)
	end


	----REPORTS LOGIC
	if dref.getInt(engine_show) == 1 then 
		if dref.getInt(burn_baby) == 6 or dref.getInt(fire_partner) == 6 then
			dref.setInt(report_fire, 1)
		else
			dref.setInt(report_fire, 0)
		end
	else
		dref.setInt(report_fire, 0)
	end

	if dref.getInt(engine_show) == 1 and dref.getInt(disparo) == 6 then
		dref.setInt(report_disparo, 1)
	else
		dref.setInt(report_disparo, 0)
	end

	if dref.getInt(engine_show) == 1 and dref.getInt(prop_strike) == 6 then
		dref.setInt(report_pstrike, 1)
	else
		dref.setInt(report_pstrike, 0)
	end

	if dref.getInt(engine_show) == 1 and dref.getInt(strainer_status) < 2 then
		dref.setInt(report_strainer, 1)
	else
		dref.setInt(report_strainer, 0)
	end

	if dref.getInt(engine_show) == 1 and dref.getInt(engine_is_hydrolocked) == 1 then
		dref.setInt(report_hydro, 1)
	else
		dref.setInt(report_hydro, 0)
	end

	if dref.getInt(engine_show) == 1 then
		if dref.getInt(warmup_fail) >= 3 or dref.getInt(oil_pressure_fail) == 6 then
			dref.setInt(report_metal, 1)
		else
			dref.setInt(report_metal, 0)
		end
	else
		dref.setInt(report_metal, 0)
	end

	if dref.getInt(engine_show) == 1 and dref.getInt(rod_is_bent) == 1 then
		dref.setInt(report_bent, 1)
		dref.setInt(show_bent_rod, 1)
	else
		dref.setInt(show_bent_rod, 0)
		dref.setInt(report_bent, 0)
	end

	if dref.getInt(engine_show) == 1 and dref.getInt(engine_broken_consequence) == 6 then
		dref.setInt(report_seized, 1)
		dref.setInt(show_seized_rod, 1)
	else
		dref.setInt(report_seized, 0)
		dref.setInt(show_seized_rod, 0)
	end

	if dref.getInt(engine_show) == 1 and dref.getInt(report_bent) == 0 then
		if dref.getInt(report_seized) == 0 then
			dref.setInt(show_good_rods, 1)
		else
			dref.setInt(show_good_rods, 0)
		end
	else
		dref.setInt(show_good_rods, 0)
	end

	------------------OIL MENU

	if dref.getInt(oil_show) == 1 then
		if dref.getFloat(our_oil) > 11 then
			dref.setInt(oil_good, 1)
		else
			dref.setInt(oil_good, 0)
		end
		if dref.getFloat(our_oil) > 7 and dref.getFloat(our_oil) <= 11 then
			dref.setInt(oil_caut, 1)
		else
			dref.setInt(oil_caut, 0)
		end
		
		if dref.getFloat(our_oil) <= 7 then
			dref.setInt(oil_bad, 1)
		else
			dref.setInt(oil_bad, 0)
		end
	else
		dref.setInt(oil_good, 0)
		dref.setInt(oil_caut, 0)
		dref.setInt(oil_bad, 0)
	end

	-----------AIRFRAME MENU

	if dref.getInt(airframe_overhauled) == 1 then
		dref.setInt(my_age, 0)
		dref.setInt(airframe_overhauled, 0)
	end


	--25hrs
	if dref.getInt(my_age) <= 1500 then
		dref.setInt(new_boy, 1)
		dref.setInt(getting_older, 0)
		dref.setInt(getting_more_older, 0)
		dref.setInt(pretty_beaten, 0)
	end
	--Between 25 and 50 hrs
	if dref.getInt(my_age) > 1500 and dref.getInt(my_age) <= 3000 then
		dref.setInt(new_boy, 0)
		dref.setInt(getting_older, 1)
		dref.setInt(getting_more_older, 0)
		dref.setInt(pretty_beaten, 0)
	end
	--Between 50 and 75 hrs
	if dref.getInt(my_age) > 3000 and dref.getInt(my_age) <= 4500 then
		dref.setInt(new_boy, 0)
		dref.setInt(getting_older, 0)
		dref.setInt(getting_more_older, 1)
		dref.setInt(pretty_beaten, 0)	
	end
	--Over 75hrs old	
	if dref.getInt(my_age) > 4500 then	
		dref.setInt(new_boy, 0)
		dref.setInt(getting_older, 0)
		dref.setInt(getting_more_older, 0)
		dref.setInt(pretty_beaten, 1)
	end






	----------REFILL TIME!

	if dref.getInt(oil_filled) == 1 then
		dref.setFloat(our_oil, 15)
		dref.setFloat(oil_age, 0)
		dref.setFloatV(xdr_oilquan, 1, 0.85)
		dref.setFloat(oil_pool, 0)
	end


	----------MainM Previews

	if dref.getInt(mainm_show) == 1 then
		if dref.getInt(autostart_on) == 1 then
			dref.setInt(tick_auto_start, 1)
		else
			dref.setInt(tick_auto_start, 0)
		end
		if dref.getInt(disable_truevintage) == 1 then
			dref.setInt(tick_disable_truevintage, 1)
		else
			dref.setInt(tick_disable_truevintage, 0)
		end
		if dref.getInt(auto_preflight) == 1 then
			dref.setInt(tick_auto_preflight, 1)
		else
			dref.setInt(tick_auto_preflight, 0)
		end
		if dref.getInt(disable_dust) == 1 then
			dref.setInt(tick_disable_dust, 1)
		else
			dref.setInt(tick_disable_dust, 0)
		end
	else
		dref.setInt(tick_auto_preflight, 0)
		dref.setInt(tick_auto_start, 0)
		dref.setInt(tick_disable_dust, 0)
		dref.setInt(tick_disable_truevintage, 0)
		dref.setInt(engn_preview_bad, 0)
		dref.setInt(engn_preview_caut, 0)
		dref.setInt(engn_preview_good, 0)
		dref.setInt(oil_preview_bad, 0)
		dref.setInt(oil_preview_caut, 0)
		dref.setInt(oil_preview_good, 0)
	end

	--------------------Assistance Menu
	if dref.getInt(ass_show) then
		if dref.getInt(help_prime) == 1 then
			dref.setInt(primed, 6)
			dref.setInt(help_prime, 0)
		end	
		if dref.getInt(help_crank) == 1 then
			if dref.getInt(engine_is_hydrolocked) == 0 then
				if dref.getIntV(xdr_engine_on, 1, 1) == 0 then
					dref.setInt(is_crank_on, 1)
					if dref.getFloat(crank_deg) <= 359 then
						dref.setFloat(crank_deg, (dref.getFloat(crank_deg) + (dref.getFloat(time) * 300)))
					else
						dref.setFloat(crank_deg, 0)
						if dref.getInt(trigger) == 0 then
							dref.setInt(trigger, 1)
						else 
							dref.setInt(fire, 1)
							dref.setInt(trigger, 0)
						end
		
					end
				else
					dref.setInt(is_crank_on, 0)
					dref.setInt(help_crank, 0)
				end
			else
				dref.setInt(help_crank, 0)
			end
		end
			
	end

	--Oil Meter
	if dref.getInt(oil_show) == 1 then

	if dref.getFloat(our_oil) >= 15 then
		dref.setInt(oil_15, 1)
	else
		dref.setInt(oil_15, 0)
	end

	if dref.getFloat(our_oil) >= 14 and dref.getFloat(our_oil) < 15 then
		dref.setInt(oil_14, 1)
	else
		dref.setInt(oil_14, 0)
	end

	if dref.getFloat(our_oil) >= 13 and dref.getFloat(our_oil) < 14 then
		dref.setInt(oil_13, 1)
	else
		dref.setInt(oil_13, 0)
	end

	if dref.getFloat(our_oil) >= 12 and dref.getFloat(our_oil) < 13 then
		dref.setInt(oil_12, 1)
	else
		dref.setInt(oil_12, 0)
	end

	if dref.getFloat(our_oil) >= 11 and dref.getFloat(our_oil) < 12 then
		dref.setInt(oil_11, 1)
	else
		dref.setInt(oil_11, 0)
	end

	if dref.getFloat(our_oil) >= 10 and dref.getFloat(our_oil) < 11 then
		dref.setInt(oil_10, 1)
	else
		dref.setInt(oil_10, 0)
	end

	if dref.getFloat(our_oil) >= 9 and dref.getFloat(our_oil) < 10 then
		dref.setInt(oil_9, 1)
	else
		dref.setInt(oil_9, 0)
	end

	if dref.getFloat(our_oil) >= 8 and dref.getFloat(our_oil) < 9 then
		dref.setInt(oil_8, 1)
	else
		dref.setInt(oil_8, 0)
	end

	if dref.getFloat(our_oil) >= 7 and dref.getFloat(our_oil) < 8 then
		dref.setInt(oil_7, 1)
	else
		dref.setInt(oil_7, 0)
	end

	if dref.getFloat(our_oil) >= 6 and dref.getFloat(our_oil) < 7 then
		dref.setInt(oil_6, 1)
	else
		dref.setInt(oil_6, 0)
	end

	if dref.getFloat(our_oil) >= 5 and dref.getFloat(our_oil) < 6 then
		dref.setInt(oil_5, 1)
	else
		dref.setInt(oil_5, 0)
	end

	if dref.getFloat(our_oil) < 5 then
		dref.setInt(oil_4, 1)
	else
		dref.setInt(oil_4, 0)
	end

	else
		dref.setInt(oil_15, 0)
		dref.setInt(oil_14, 0)
		dref.setInt(oil_13, 0)
		dref.setInt(oil_12, 0)
		dref.setInt(oil_11, 0)
		dref.setInt(oil_10, 0)
		dref.setInt(oil_9, 0)
		dref.setInt(oil_8, 0)
		dref.setInt(oil_7, 0)
		dref.setInt(oil_6, 0)
		dref.setInt(oil_5, 0)
		dref.setInt(oil_4, 0)
	end




	--POH menu stuff

	if dref.getInt(poh_pagemode) == 2 then
		dref.setInt(POH_page, (dref.getInt(POH_page)+1))
		dref.setInt(poh_pagemode, 0)
	end

	if dref.getInt(poh_pagemode) == 1 then
		dref.setInt(POH_page, (dref.getInt(POH_page)-1))
		dref.setInt(poh_pagemode, 0)
	end

	if dref.getInt(POH_page) >= 9 then
		dref.setInt(POH_page, 8)
	end


























end
