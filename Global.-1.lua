function init()
    -- 玩家颜色列表
    playerColorList      = getSeatedPlayers()

    -- 角色
    settler              = getObjectFromGUID("ade655")
    mayor                = getObjectFromGUID("3f1f84")
    builder              = getObjectFromGUID("ed84e9")
    craftsman            = getObjectFromGUID("679f07")
    trader               = getObjectFromGUID("ca2c44")
    captain              = getObjectFromGUID("93eb06")
    prospector1          = getObjectFromGUID("bdab1d")
    prospector2          = getObjectFromGUID("c7dbd4")
    governor             = getObjectFromGUID("99ef60")

    -- 板块
    playerBoardYellow    = getObjectFromGUID("263342")
    playerBoardBlue      = getObjectFromGUID("d76a03")
    playerBoardWhite     = getObjectFromGUID("8a5373")
    playerBoardOrange    = getObjectFromGUID("15f601")
    playerBoardBrown     = getObjectFromGUID("c4adf4")
    colonistHouse        = getObjectFromGUID("5c1212")
    tradingHouse         = getObjectFromGUID("8bdd04")
    cargo4               = getObjectFromGUID("937662")
    cargo5               = getObjectFromGUID("8a639f")
    cargo6               = getObjectFromGUID("9c07bf")
    cargo7               = getObjectFromGUID("8cce9d")
    cargo8               = getObjectFromGUID("a3dd31")

    -- 脚本区域
    colonistShipZone     = getObjectFromGUID("49320f")
    plantationZoneYellow = getObjectFromGUID("bbdfc0")
    plantationZoneBlue   = getObjectFromGUID("66b81f")
    plantationZoneWhite  = getObjectFromGUID("972259")
    plantationZoneOrange = getObjectFromGUID("5aa35e")
    plantationZoneBrown  = getObjectFromGUID("46b72a")

    -- 袋子
    bag1Doubloon         = getObjectFromGUID("6b6fac")
    bagPlantation        = getObjectFromGUID("0b7761")

    -- 文本
    text                 = getObjectFromGUID("986d33")


    -- 运输船列表
    shipList = { cargo4, cargo5, cargo6, cargo7, cargo8 }

    topShip  = shipList[#playerColorList - 0]
    midShip  = shipList[#playerColorList - 1]
    botShip  = shipList[#playerColorList - 2]
end

-- 建筑列表
buildingList = {
    smallIndigoPlant = { circle = 1, score = 0 },
    indigoPlant      = { circle = 3, score = 0 },
    smallSugarMill   = { circle = 1, score = 0 },
    sugarMill        = { circle = 3, score = 0 },
    tobaccoStorage   = { circle = 3, score = 0 },
    coffeeRoaster    = { circle = 2, score = 0 }
}

-- 角色初始坐标
rolePos = {
    Craftsman   = { -8.20, -2.97, 5.67 },
    Builder     = { -8.20, -2.97, 0.98 },
    Prospector1 = { -8.20, -2.97, 15.05 },
    Prospector2 = { -8.20, -2.97, 10.36 },
    Trader      = { -8.20, -2.97, 10.36 },
    Mayor       = { -11.25, -2.97, 5.67 },
    Settler     = { -11.25, -2.92, 0.98 },
    Captain     = { -11.25, -2.97, 10.36 }
}

-- 玩家区域坐标
playerPos = {
    Yellow = {
        role     = { -47.00, -2.97, -8.00 },
        assign   = { -51.00, -2.97, -8.00 },
        governor = { -44.00, -2.97, -8.00 },
        building = { 0, 0, 0 }
    },
    Blue   = {
        role     = { -25.00, -2.97, -8.00 },
        assign   = { -29.00, -2.97, -8.00 },
        governor = { -22.00, -2.97, -8.00 },
        building = { 0, 0, 0 }
    },
    White  = {
        role     = { -3.06, -2.97, -7.99 },
        assign   = { -7.06, -2.97, -8.00 },
        governor = { -0.06, -2.97, -7.99 },
        building = { 0, 0, 0 }
    },
    Orange = {
        role     = { 19.00, -2.97, -8.00 },
        assign   = { 15.00, -2.97, -8.00 },
        governor = { 22.00, -2.97, -8.00 },
        building = { 0, 0, 0 }
    },
    Brown  = {
        role     = { 41.00, -2.97, -8.00 },
        assign   = { 37.00, -2.97, -8.00 },
        governor = { 44.00, -2.97, -8.00 },
        building = { 0, 0, 0 }
    }
}

-- 加载
function onLoad()
    -- 初始化
    init()
    -- 总督
    governor.createButton({
        click_function = "setup",
        position = { 0, 0.1, 0.75 },
        rotation = { 0, 0, 0 },
        width = 150,
        font_size = 50,
        label = "setup"
    })
    -- 勘探者1
    prospector1.createButton({
        click_function = "prospector",
        position       = { 0.5, 0.1, -0.9 },
        rotation       = { 0, 0, 0 },
        font_size      = 50,
        label          = "take"
    })
    -- 勘探者2
    prospector2.createButton({
        click_function = "prospector",
        position       = { 0.5, 0.1, -0.9 },
        rotation       = { 0, 0, 0 },
        font_size      = 50,
        label          = "take"
    })
    -- 船长
    captain.createButton({
        click_function = "take",
        position       = { 0.5, 0.1, -0.9 },
        rotation       = { 0, 0, 0 },
        font_size      = 50,
        label          = "take"
    })
    -- 商人
    trader.createButton({
        click_function = "take",
        position       = { 0.5, 0.1, -0.9 },
        rotation       = { 0, 0, 0 },
        font_size      = 50,
        label          = "take"
    })
    -- 市长
    mayor.createButton({
        click_function = "take",
        position       = { 0.5, 0.1, -0.9 },
        rotation       = { 0, 0, 0 },
        font_size      = 50,
        label          = "take"
    })
    mayor.createButton({
        click_function = "assignColonists",
        position       = { -0.2, 0.1, 0.25 },
        rotation       = { 0, 0, 0 },
        width          = 175,
        font_size      = 50,
        label          = "assign"
    })
    mayor.createButton({
        click_function = "supplyColonists",
        position       = { 0.2, 0.1, 0.25 },
        rotation       = { 0, 0, 0 },
        width          = 175,
        font_size      = 50,
        label          = "supply"
    })
    -- 工匠
    craftsman.createButton({
        click_function = "take",
        position       = { 0.5, 0.1, -0.9 },
        rotation       = { 0, 0, 0 },
        font_size      = 50,
        label          = "take"
    })
    craftsman.createButton({
        click_function = "produce",
        position       = { 0, 0.1, 0.30 },
        rotation       = { 0, 0, 0 },
        width          = 175,
        font_size      = 50,
        label          = "produce"
    })
    -- 开拓者
    settler.createButton({
        click_function = "take",
        position       = { 0.5, 0.1, -0.9 },
        rotation       = { 0, 0, 0 },
        font_size      = 50,
        label          = "take"
    })
    -- 建筑师
    builder.createButton({
        click_function = "take",
        position       = { 0.5, 0.1, -0.9 },
        rotation       = { 0, 0, 0 },
        font_size      = 50,
        label          = "take"
    })
    -- 玩家Yellow
    playerBoardYellow.createButton({
        click_function = "pay",
        position       = { 0.5, 0.1, -0.9 },
        rotation       = { 0, 0, 0 },
        font_size      = 50,
        label          = "pay"
    })
    -- 玩家Blue
    playerBoardBlue.createButton({
        click_function = "pay",
        position       = { 0.5, 0.1, -0.9 },
        rotation       = { 0, 0, 0 },
        font_size      = 50,
        label          = "pay"
    })
    -- 玩家White
    playerBoardWhite.createButton({
        click_function = "pay",
        position       = { 0.5, 0.1, -0.9 },
        rotation       = { 0, 0, 0 },
        font_size      = 50,
        label          = "pay"
    })
    -- 玩家Orange
    playerBoardOrange.createButton({
        click_function = "pay",
        position       = { 0.5, 0.1, -0.9 },
        rotation       = { 0, 0, 0 },
        font_size      = 50,
        label          = "pay"
    })
    -- 玩家Brown
    playerBoardBrown.createButton({
        click_function = "pay",
        position       = { 0.5, 0.1, -0.9 },
        rotation       = { 0, 0, 0 },
        font_size      = 50,
        label          = "pay"
    })
    -- 定时函数：文本显示殖民船殖民数
    Wait.time(
        function()
            local objList = {}
            for _, obj in ipairs(colonistShipZone.getObjects(true)) do
                if obj.hasTag("colonists") then
                    table.insert(objList, obj)
                end
            end
            text.setValue(tostring(#objList))
        end,
        1, -1
    )
end

-- 对象进入区域触发函数
function onObjectEnterZone(zone, obj)
    -- 删除标签
    if isPlantationZone(zone) then
        obj.removeTag("chip remain")
        obj.removeTag("plantation")
    end
end

-- 获取区域中指定标签对象列表
function getObjListFromZoneWithTag(zone, tag)
    objList = {}
    for _, obj in pairs(zone.getObjects(true)) do
        if obj.hasTag(tag) then
            table.insert(objList, obj)
        end
    end
    return objList
end

-- 勘探者
function prospector(obj, color)
    take(obj, color)
    -- 勘探者特权
    bag1Doubloon.takeObject({ position = playerPos[color].assign })
end

-- 拿取角色
function take(obj, color)
    -- 替换标签
    obj.removeTag("role remain")
    obj.addTag("role select")
    -- 移动 role 至玩家角色区
    obj.setPositionSmooth(playerPos[color].role, false, true)
    -- 碰撞检测
    local hitList = Physics.cast({
        origin       = obj.getPosition(),
        direction    = { 0, 1, 0 },
        max_distance = 5
    })
    -- 移动 hitList 至玩家分配区
    for _, obj in ipairs(hitList) do
        obj.hit_object.setPositionSmooth(playerPos[color].assign, false, true)
    end
end

-- 设置
function setup(obj)
    -- 生成袋子
    bagCorn     = spawnObject({ type = "Bag", position = { 2, 2, -9 } })
    bagIndigo   = spawnObject({ type = "Bag", position = { 4, 2, -9 } })
    bagSugar    = spawnObject({ type = "Bag", position = { 6, 2, -9 } })
    bagTobacco  = spawnObject({ type = "Bag", position = { 8, 2, -9 } })
    bagCoffee   = spawnObject({ type = "Bag", position = { 10, 2, -9 } })
    bagColonist = spawnObject({ type = "Bag", position = { -8, 2, -9 } })
    -- 设置袋子颜色
    bagCorn.setColorTint(Color.Yellow)
    bagIndigo.setColorTint(Color.Blue)
    bagSugar.setColorTint(Color.White)
    bagTobacco.setColorTint(Color.Brown)
    bagCoffee.setColorTint(Color.Black)
    -- 设置袋子名称
    bagCorn.setName("Corn")
    bagIndigo.setName("Indigo")
    bagSugar.setName("Sugar")
    bagTobacco.setName("Tobacco")
    bagCoffee.setName("Coffee")
    -- 删除 setup 按钮
    obj.removeButton(0)
    -- 创建 next 按钮
    obj.createButton({
        click_function = "next",
        position       = { 0, 0.1, 0.75 },
        rotation       = { 0, 0, 0 },
        width          = 150,
        font_size      = 50,
        label          = "next"
    })
    -- 回收货物 & 殖民 & 农场
    recycleWithName(getObjectsWithTag("goods"))
    recycle(bagColonist, getObjectsWithTag("colonists"))
    recycle(bagPlantation, getObjListWithTag("plantation"))
    -- 移动袋子
    bagCorn.setPositionSmooth({ 2, 2, -3 }, false, true)
    bagIndigo.setPositionSmooth({ 4, 2, -3 }, false, true)
    bagSugar.setPositionSmooth({ 6, 2, -3 }, false, true)
    bagTobacco.setPositionSmooth({ 8, 2, -3 }, false, true)
    bagCoffee.setPositionSmooth({ 10, 2, -3 }, false, true)
    bagColonist.setPositionSmooth({ -8, 2, -3 }, false, true)
    -- 补充农场
    supplyPlantation()
    -- 补充殖民
    supplyColonistsWithNum(#playerColorList)
end

-- 获取对象列表
function getObjListWithTag(tag)
    local objList = {}
    for _, obj in ipairs(getObjectsWithTag(tag)) do
        if not obj.hasTag("quarry") then
            table.insert(objList, obj)
        end
    end
    return objList
end

-- 通过名称回收对象至对应袋子
function recycleWithName(objList)
    for _, obj in pairs(objList) do
        getBagWithName(obj.getName()).putObject(obj)
    end
end

-- 回收对象至指定容器
function recycle(container, objList)
    for _, obj in ipairs(objList) do
        container.putObject(obj)
    end
end

-- 通过名称获取袋子对象
function getBagWithName(name)
    for _, obj in ipairs(getObjects()) do
        if obj.getName() == name and obj.type == "Bag" then
            return obj
        end
    end
end

-- 补充殖民（玩家数）至指定坐标附近
function supplyColonistsWithNum(num)
    for i = 1, num do
        randomMove(bagColonist, colonistHouse.getPosition())
    end
end

-- 从容器中取出对象至指定坐标附近
function randomMove(container, pos)
    container.takeObject({
        position = {
            pos.x + math.random() - 1,
            math.random() + 1,
            pos.z + math.random() - 1
        }
    })
end

-- 补充农场
function supplyPlantation()
    if #bagPlantation.getObjects() < #playerColorList + 1 then
        recycle(getObjectsWithTag("chip ignore"))
    end

    local num = math.min(#bagPlantation.getObjects(), #playerColorList + 1)

    bagPlantation.shuffle()

    for i = 1, num do
        bagPlantation.takeObject({
            position = { i * 2 - 5, 2, 18.5 }
        }).addTag("chip remain")
    end
end

-- 下一年
function next(obj, currColor)
    -- 移动 governor 至下一位玩家
    local nextColor = getNextColor(currColor)
    obj.setPositionSmooth(playerPos[nextColor].governor, false, true)
    -- role remain 标签对象设置 1 doubloon
    for _, obj in ipairs(getObjectsWithTag("role remain")) do
        bag1Doubloon.takeObject({
            position = { obj.getPosition().x, 2, obj.getPosition().z }
        })
    end
    -- 移动 role select 标签对象至初始位置
    -- 所有 role select 标签替换 role remain 标签
    for _, obj in ipairs(getObjectsWithTag("role select")) do
        obj.setPositionSmooth(rolePos[obj.getName()], false, true)
        obj.removeTag("role select")
        obj.addTag("role remain")
    end
    -- 清空运输船如果已满
    local topShipGoodsList = getObjListWithShip(topShip)
    local midShipGoodsList = getObjListWithShip(midShip)
    local botShipGoodsList = getObjListWithShip(botShip)
    local topShipGoodsLimit = #playerColorList + 3
    local midShipGoodsLimit = #playerColorList + 2
    local botShipGoodsLimit = #playerColorList + 1
    if #topShipGoodsList == topShipGoodsLimit then
        recycleWithName(topShipGoodsList)
    end
    if #midShipGoodsList == midShipGoodsLimit then
        recycleWithName(midShipGoodsList)
    end
    if #botShipGoodsList == botShipGoodsLimit then
        recycleWithName(botShipGoodsList)
    end
    -- 清空交易所如果已满
    local tradingHouseGoodsList = getObjListWithTrade(tradingHouse)
    if #tradingHouseGoodsList == 4 then
        recycleWithName(tradingHouseGoodsList)
    end
    -- 弃牌区坐标
    local pos = { x = 0, y = 2, z = 0 }
    -- 清理农场
    for _, obj in ipairs(getObjectsWithTag("chip remain")) do
        obj.removeTag("chip remain")
        obj.addTag("chip ignore")
        obj.setPositionSmooth(pos, false, true)
    end
    -- 整理农场
    local plantationList = getObjectsWithTag("chip ignore")
    for i = 1, #plantationList do
        plantationList[i].setPositionSmooth({
            pos.x + i % 5,
            pos.y,
            pos.z - i / 5
        }, false, true)
    end
    -- 补充农场
    supplyPlantation()
end

-- 获取运输船对象列表
function getObjListWithShip(ship)
    local objList = {}
    -- 非空校验
    if ship == nil then
        return objList
    end
    -- 碰撞检测
    local hitList = getHitListByBoxCast(ship.getPosition(), { 4, 2, 2 })
    -- 通过标签过滤对象
    for _, element in ipairs(hitList) do
        if element.hit_object.hasTag("goods") then
            table.insert(objList, element.hit_object)
        end
    end
    return objList
end

-- 获取交易所对象列表
function getObjListWithTrade(obj)
    local objList = {}
    local hitList = getHitListByBoxCast(obj.getPosition(), { 2, 2, 4 })
    for _, element in ipairs(hitList) do
        if element.hit_object.hasTag("goods") then
            table.insert(objList, element.hit_object)
        end
    end
    return objList
end

function getHitListByBoxCast(pos, size)
    local hitList = Physics.cast({
        origin       = pos,
        direction    = { 0, 1, 0 },
        type         = 3,
        size         = size,
        max_distance = 1,
        debug        = true
    })
    return hitList
end

-- 获取下一位玩家颜色
function getNextColor(currColor)
    for i = 1, #playerColorList do
        if playerColorList[i] == currColor then
            return playerColorList[i % #playerColorList + 1]
        end
    end
end

-- 分配殖民
function assignColonists(obj, color)
    -- 市长特权
    if #bagColonist.getObjects() ~= 0 then
        bagColonist.takeObject({ position = playerPos[color].assign })
    end
    -- 分配殖民
    local objList = getObjListFromZoneWithTag(colonistShipZone, "colonists")
    for _, obj in ipairs(objList) do
        obj.setPositionSmooth(playerPos[color].assign, false, true)
        color = getNextColor(color)
    end
end

-- 补充殖民
function supplyColonists()
    -- 计算建筑区空缺与殖民总数
    local cnt = countCirclesAndColonistsWithGlobal()
    -- 差值 > 玩家数 ? 差值 : 玩家数
    local num = math.max(cnt.circles - cnt.colonists, #playerColorList)
    -- 补充殖民
    supplyColonistsWithNum(num)
end

-- 计算全局建筑物空缺与殖民数量
function countCirclesAndColonistsWithGlobal()
    local circles, colonists
    for _, color in ipairs(playerColorList) do
        local cnt = countCirclesAndColonistsWithColor(color)
        circles = (circles or 0) + cnt.circles
        colonists = (colonists or 0) + cnt.colonists
    end
    return { circles = circles, colonists = colonists }
end

-- 计算玩家建筑物空缺与殖民数量
function countCirclesAndColonistsWithColor(color)
    local circles, colonists
    local objList = getObjListFromBuildWithColor(color)
    for _, obj in ipairs(objList) do
        if obj.hasTag("colonist") then
            colonists = (colonists or 0) + 1
        end
        if obj.hasTag("building") then
            circles = (circles or 0) + (buildingList[toCamelCase(obj.getName())].circle or 1)
        end
    end
    return { circles = circles, colonists = colonists }
end

-- 获取玩家建筑区对象列表
function getObjListFromBuildWithColor(color)
    return getHitListByBoxCast(playerPos[color].building, { 1, 1, 1 })
end

-- 生产
function produce(obj, color)
    for i = 1, #playerColorList do
        -- 计算当前玩家生效玉米数量
        -- 计算当前玩家生效靛蓝数量
        -- 计算当前玩家生效砂糖数量
        -- 计算当前玩家生效烟草数量
        -- 计算当前玩家生效咖啡数量
        -- 分配玉米
        -- 分配靛蓝
        -- 分配砂糖
        -- 分配烟草
        -- 分配咖啡
        color = getNextColor(color)
    end
end

-- 回收 doubloon
function pay()

end

-- 计算分数&财富
function calcScoreAndMoney()

end

-- 驼峰命名法
function toCamelCase(str)

end

-- 判断是否为农场区
function isPlantationZone(zone)
    if zone ~= plantationZoneYellow and zone ~= plantationZoneBlue and zone ~= plantationZoneOrange and zone ~= plantationZoneWhite and zone ~= plantationZoneBrown then
        return false
    else
        return true
    end
end
