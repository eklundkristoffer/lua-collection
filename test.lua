local inspect = require('inspect')
local collection = require('collection')

local data = {
    { state = 'US' },
    { state = 'UK' },
    { state = 'US' },
    { state = 'UK' }
}

local collection = Collection:collect(data):groupBy('state')

print(inspect(collection))
