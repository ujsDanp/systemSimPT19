function pt19_camera()

	dref.setInt(cube_prep_mode, 2)

	if dref.getFloat(p_x) > 1.1 or dref.getFloat(p_x) < -1.1 then

		dref.setInt(x_con, 1)
	else
		dref.setInt(x_con, 0)
	end

	if dref.getFloat(p_y) > 1.5 or dref.getFloat(p_y) < - 0.5 then

		dref.setInt(y_con, 1)
	else
		dref.setInt(y_con, 0)
	end

	if dref.getFloat(p_z) > 2.3 or dref.getFloat(p_z) < - 0.5 then

		dref.setInt(z_con, 1)
	else
		dref.setInt(z_con, 0)
	end
	--Rule in action

	--if dref.getFloat(x_con) == 1 or dref.getFloat(y_con) == 1 or dref.getFloat(z_con) == 1 or dref.getFloat(is_external) == 1 then
	if dref.getInt(is_external) == 1 then
		dref.setInt(conflicting, 1)
	else
		dref.setInt(conflicting, 0)
	end


end
