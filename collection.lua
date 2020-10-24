local Collection = {}
Collection_mt = { __index = Collection }

-- Create a new Collection instance.
--
-- @param  data  table
-- @return self
function Collection:collect(data)
    return setmetatable(data, Collection_mt)
end

-- Append a new item to the end of Collection.
--
-- @param  mixed  value
-- @return void
function Collection:push(value)
    table.insert(self, value)
end

-- Returns the Collection data.
--
-- @return data
function Collection:all()
    return self
end

-- Determine if a given key exists in the Collection.
--
-- @param  string  key
-- @return boolean
function Collection:has(key)
    return self[key] ~= nil
end

-- Returns the item at given key.
--
-- @param  string  key
-- @return nil|mixed
function Collection:get(key)
    if self:has(key) then
        return self[key]
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
    self[key] = value
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

    self = results

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

-- Pass the collection to the given callback and return the result.
--
-- @param  callable callback
-- @return mixed
function Collection:pipe(callback)
    callback(self)
end

-- Create a new collection by invoking the callback a given amount of times.
--
-- @param  integer  number
-- @param  callable callback
-- @return Collection
function Collection:times(number, callback)
    local collection = self:collect({})

    local i = 1
    while i <= number do
        collection:push(callback(i))
        i = i + 1
    end

    return collection
end
