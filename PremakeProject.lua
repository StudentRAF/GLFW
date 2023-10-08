project "GLFW3"
	kind          "StaticLib"
	language      "C"
	cdialect      "C17"
	staticruntime "Off"
	warnings      "Default"
	targetname    "glfw3"
	
	files
	{
		"include/GLFW/glfw3.h",
		"include/GLFW/glfw3native.h",

		"src/glfw_config.h",

		"src/context.c",
		"src/init.c",
		"src/input.c",
		"src/monitor.c",
		"src/vulkan.c",
		"src/window.c",
	
		"src/egl_context.h",
		"src/osmesa_context.h",

		"src/egl_context.c",
		"src/osmesa_context.c",
	}

	filter "system:linux" --- NOT Tested
		pic "On"
		
		files
		{
			"src/glx_context.h",
			"src/linux_joystick.h",
			"src/posix_thread.h",
			"src/posix_time.h",
			"src/x11_platform.h",
			"src/xkb_unicode.h",

			"src/glx_context.c",
			"src/linux_joystick.c",
			"src/posix_thread.c",
			"src/posix_time.c",
			"src/x11_init.c",
			"src/x11_monitor.c",
			"src/x11_window.c",
			"src/xkb_unicode.c"
		}

		defines
		{
			"_GLFW_X11"
		}

	filter "system:macosx" --- NOT Tested
		pic "On"
		
		files
		{
			"src/cocoa_platform.h",
			"src/cocoa_joystick.h",
			"src/nsgl_context.h",
			"src/posix_thread.h",

			"src/cocoa_init.m",
			"src/cocoa_joystick.m",
			"src/cocoa_monitor.m",
			"src/cocoa_window.m",
			"src/cocoa_time.c",
			"src/nsgl_context.m",
			"src/posix_thread.c"
		}

		defines
		{
			"_GLFW_COCOA"
		}

	filter "system:windows"
		systemversion "latest"

		files
		{
			"src/wgl_context.h",
			"src/win32_joystick.h",
			"src/win32_platform.h",

			"src/wgl_context.c",
			"src/win32_init.c",
			"src/win32_joystick.c",
			"src/win32_monitor.c",
			"src/win32_thread.c",
			"src/win32_time.c",
			"src/win32_window.c"
		}

		defines 
		{ 
			"_CRT_SECURE_NO_WARNINGS",
			"_GLFW_WIN32"
		}

	filter "configurations:Debug"
		runtime "Debug"
		symbols "On"

	filter "configurations:Release"
		runtime "Release"
		optimize "On"
		symbols "Off"

