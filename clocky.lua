
------------------------------------A-11 logic
function clocky()
	if dref.getInt(winding_left) > 0 then
		dref.setFloat(clock_inner_timer, (dref.getFloat(clock_inner_timer)+dref.getFloat(time)))
	else
		dref.setFloat(clock_inner_timer, 0)
	end

	if dref.getFloat(clock_hours) >= 360 then
		dref.setFloat(clock_hours, 0)
	end
	if dref.getFloat(clock_minutes) >= 360 then
		dref.setFloat(clock_minutes, 0)
	end
	if dref.getInt(clock_seconds) >= 60 then
		dref.setInt(clock_seconds, 0)
	end

	if dref.getFloat(clock_inner_timer) >= 1 then
		dref.setInt(clock_seconds, (dref.getInt(clock_seconds)+1))
		dref.setFloat(clock_minutes, (dref.getFloat(clock_minutes)+0.1))
		dref.setFloat(clock_hours, (dref.getFloat(clock_hours)+(1/120)))
		dref.setInt(winding_left, (dref.getInt(winding_left)-1))
		dref.setFloat(clock_inner_timer, 0)
	end


	if dref.getInt(clock_tuning) == 1 then
		dref.setInt(clock_seconds, (dref.getInt(clock_seconds)+(1*24)))
		dref.setFloat(clock_minutes, (dref.getFloat(clock_minutes)+(0.1*24)))
		dref.setFloat(clock_hours, (dref.getFloat(clock_hours)+((1/120)*24)))
	end

	if dref.getInt(rewinding) == 1 then
		dref.setInt(winding_left, (dref.getInt(winding_left)+1000))
	end
	if dref.getInt(winding_left) > 691200 then
		dref.setInt(winding_left, 691200)
	end
end