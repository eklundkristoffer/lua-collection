# Functions
  * [Collection:collect()](#collect)
  * [Collection:push()](#push)
  * [Collection:all()](#all)
  * [Collection:has()](#has)
  * [Collection:get()](#get)
  * [Collection:put()](#put)
  * [Collection:groupBy()](#groupby)
  * [Collection:each()](#each)
  * [Collection:count()](#count)
  * [Collection:pipe()](#pipe)
  * [Collection:times()](#times)
  
## collect
```lua
local myCollection = Collection.collect({ key = 'value' })
```

## push
```lua
myCollection:push('Hello World')
```

## all
```lua
myCollection:all()
```

## has
```lua
if myCollection:has('key') then
  -- key exists in the collection
end
```

## get
```lua
myCollection:get('key')
```

## put
```lua
myCollection:put('key', 'value')
```

## groupBy
```lua
local data = {
    { state = 'US' },
    { state = 'UK' },
    { state = 'US' },
    { state = 'UK' }
}

local collection = Collection:collect(data):groupBy('state')

-- { 
--     ["US"] = { 
--         [1] = { ["state"] = "US" },
--         [2] = { ["state"] = "US" }
--     } ,
--     ["UK"] = { 
--         [1] = { ["state"] = "UK" },
--         [2] = { ["state"] = "UK" }
--     }
-- }
```

## each
```lua
myCollection:each(function (key, value)
    --
end)
```

## count
```lua
myCollection:count()
```

## pipe
```lua
myCollection:pipe(function (collection)
    collection:push({ price = 250 })
end)
```

## times
```lua
myCollection = Collection:times(5, function (number)
    return number * 9
end)

myCollection:all()

-- {
--     [1] = 9,
--     [2] = 18,
--     [3] = 27,
--     [4] = 36,
--     [5] = 45
-- }
```
