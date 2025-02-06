workspace 'tomlc99'
	configurations {'debug', 'release'}

newoption {
	trigger = 'build-static',
	description = 'Build as a static library'
}

language 'C'
cdialect 'C99'
warnings 'Extra'
objdir 'build'
libdirs 'build'
targetdir 'build'

filter 'configurations:debug'
	symbols 'on'
	defines {'DEBUG'}

filter 'configurations:release'
	optimize 'on'
	defines {'NDEBUG'}

project 'toml'
	kind 'SharedLib'
	files {'toml.c', 'toml.h'}

	filter 'options:build-static'
		kind 'StaticLib'

project 'toml_cat'
	kind 'ConsoleApp'
	files {'toml_cat.c'}
	links {'toml'}

project 'toml_json'
	kind 'ConsoleApp'
	files {'toml_json.c'}
	links {'toml'}

project 'toml_sample'
	kind 'ConsoleApp'
	files {'toml_sample.c'}
	links {'toml'}
