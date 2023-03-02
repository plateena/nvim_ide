isModuleAvailable = function (name)
    if package.loaded[name] then
        return true
    else
        for _, searcher in ipairs(package.searchers or package.loaders) do
            local loader = searcher(name)
            if type(loader) == 'function' then
                package.preload[name] = loader
                return true
            end
        end
        return false
    end
end

isHasValueInTable = function(t, key_to_find) 

    if t == nil then return false end

    local f = false
    for key, value in pairs(t) do
        if type(value) == "table" then
            f = isHasValueInTable(value, key_to_find)
            if f then break end
        end

        if value == key_to_find then
            return true
        end
    end
    return f
end

setupPlugins = function (use, plugs, modules, basePath)
    if #plugs > 0 then
        for k, v in pairs(plugs) do
            use(v)
        end
    end

    if #modules > 0 then 
        for k, mode in pairs(modules) do
            require(basePath .. mode).plugins(use)
            if require(basePath .. mode).setup ~= nil then
                require(basePath .. mode).setup()
            end
        end
    end
end
