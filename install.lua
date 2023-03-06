local function getOS()
	local raw_os_name, raw_arch_name = '', ''

	-- LuaJIT shortcut
	if jit and jit.os and jit.arch then
		raw_os_name = jit.os
		raw_arch_name = jit.arch
	else
		-- is popen supported?
		local popen_status, popen_result = pcall(io.popen, "")
		if popen_status then
			popen_result:close()
			-- Unix-based OS
			raw_os_name = io.popen('uname -s','r'):read('*l')
			raw_arch_name = io.popen('uname -m','r'):read('*l')
		else
			-- Windows
			local env_OS = os.getenv('OS')
			local env_ARCH = os.getenv('PROCESSOR_ARCHITECTURE')
			if env_OS and env_ARCH then
				raw_os_name, raw_arch_name = env_OS, env_ARCH
			end
		end
	end

	raw_os_name = (raw_os_name):lower()
	raw_arch_name = (raw_arch_name):lower()

	local os_patterns = {
		['windows'] = 'Windows',
		['linux'] = 'Linux',
		['mac'] = 'Mac',
		['darwin'] = 'Mac',
		['^mingw'] = 'Windows',
		['^cygwin'] = 'Windows',
		['bsd$'] = 'BSD',
		['SunOS'] = 'Solaris',
	}
	
	local arch_patterns = {
		['^x86$'] = 'x86',
		['i[%d]86'] = 'x86',
		['amd64'] = 'x86_64',
		['x86_64'] = 'x86_64',
		['Power Macintosh'] = 'powerpc',
		['^arm'] = 'arm',
		['^mips'] = 'mips',
	}

	local os_name, arch_name = 'unknown', 'unknown'

	for pattern, name in pairs(os_patterns) do
		if raw_os_name:match(pattern) then
			os_name = name
			break
		end
	end
	for pattern, name in pairs(arch_patterns) do
		if raw_arch_name:match(pattern) then
			arch_name = name
			break
		end
	end
	-- return os_name, arch_name
	return os_name
end

if select(1, ...) ~= 'os_name' then
	-- print(("%q %q"):format(getOS()))
else
	return {
		getOS = getOS,
	}
end

if getOS() == 'Linux' then 
    local app = {
        "curl",
        "tar",
        "python3",
        "python3-pip",
        "python3-pynvim",
        "git",
        "bat",
        "fd-find",
        "ripgrep",
        "nodejs",
        "npm",
        "xsel",
        "fzf",
    }

    print("Installing required app/command for nvim")

    os.execute("sudo apt install -y " .. table.concat(app, " "))

    print("Create fd symlink")
    os.execute("sudo ln -s $(which fdfind) $HOME/bin/fd")

    print("Setup npm global without sudo")
    os.execute("mkdir $HOME/.npm-global")
    os.execute("npm config set prefix '~/.npm-global/")
    os.execute("pip install tasklib")
else
    print("Only work on linux")
end

