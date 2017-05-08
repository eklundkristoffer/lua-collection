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
myCollection = Collection.collect({
    { state = 'US' },
    { state = 'UK' },
    { state = 'US' },
    { state = 'UK' }
})

myCollection:groupBy('state')

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
