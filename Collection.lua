local Collection = {}
Collection.__index = Collection

-- Create a new Collection instance.
--
-- @param  table  table
-- @return self
function Collection:collect(table)
    local self = {}
    setmetatable(self, Collection)
    self.table = {}
    return self
end

-- Append a new item to the end of Collection.
--
-- @param  mixed  value
-- @return void
function Collection:push(value)
    table.insert(self.table, value)
end

-- Returns the Collection table.
--
-- @return table
function Collection:all()
    return self.table
end

-- Determine if a given key exists in the Collection.
--
-- @param  string  key
-- @return boolean
function Collection:has(key)
    return self.table[key] ~= nil
end

-- Returns the item at given key.
--
-- @param  string  key
-- @return nil|mixed
function Collection:get(key)
    if self:has(key) then
        return self.table[key]
    else
        return nil
    end
end

-- Sets the given key and value in the Collection.
--
-- @param  string  key
-- @param  string  value
-- @return void
function Collection:put(key, value)
    self.table[key] = value
end

-- Group collection items by given key.
--
-- @param  string  key
-- @return Collection
function Collection:groupBy(key)
    local results = {}

    for k,v in pairs(self:all()) do
        if results[v[key]] ~= nil then
            table.insert(results[v[key]], v)
        else
            results[v[key]] = { v }
        end
    end

    self.table = results

    return self
end

-- Execute a callback over each item.
--
-- @param  callable  callback
-- @return self
function Collection:each(callback)
    for k,v in pairs(self:all()) do 
        callback(k, v)
    end

    return self
end

-- Count the number of items in the collection.
--
-- @return integer
function Collection:count()
    return table.getn(self:all())
end