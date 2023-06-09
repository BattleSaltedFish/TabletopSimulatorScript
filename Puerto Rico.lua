-- 初始化
function init()
    -- 角色
    settler           = getObjectFromGUID("ade655")
    mayor             = getObjectFromGUID("3f1f84")
    builder           = getObjectFromGUID("ed84e9")
    craftsman         = getObjectFromGUID("679f07")
    trader            = getObjectFromGUID("ca2c44")
    captain           = getObjectFromGUID("93eb06")
    prospector1       = getObjectFromGUID("bdab1d")
    prospector2       = getObjectFromGUID("c7dbd4")
    governor          = getObjectFromGUID("99ef60")

    -- 板块
    playerBoardYellow = getObjectFromGUID("263342")
    playerBoardBlue   = getObjectFromGUID("d76a03")
    playerBoardWhite  = getObjectFromGUID("8a5373")
    playerBoardOrange = getObjectFromGUID("15f601")
    playerBoardBrown  = getObjectFromGUID("c4adf4")
    colonistHouse     = getObjectFromGUID("5c1212")
    tradingHouse      = getObjectFromGUID("8bdd04")
    cargo4            = getObjectFromGUID("937662")
    cargo5            = getObjectFromGUID("8a639f")
    cargo6            = getObjectFromGUID("9c07bf")
    cargo7            = getObjectFromGUID("8cce9d")
    cargo8            = getObjectFromGUID("a3dd31")

    -- 脚本区域
    colonistShipZone  = getObjectFromGUID("49320f")

    -- 袋子
    bag1Doubloon      = getObjectFromGUID("6b6fac")
    bag5Doubloon      = getObjectFromGUID("6a88ba")
    bagPlantation     = getObjectFromGUID("0b7761")

    -- 文本
    textColonist      = getObjectFromGUID("986d33")
    textYellow        = getObjectFromGUID("b7f4ff")
    textBlue          = getObjectFromGUID("7b362a")
    textWhite         = getObjectFromGUID("dd59c9")
    textOrange        = getObjectFromGUID("168ad7")
    textBrown         = getObjectFromGUID("6d94e3")


    -- 玩家列表
    playerList = {
        Yellow = {
            pay      = { -38.50, -2.97, -7.50 },
            role     = { -47.00, -2.97, -8.00 },
            text     = textYellow,
            color    = "Yellow",
            board    = playerBoardYellow,
            assign   = { -51.00, -2.97, -8.00 },
            governor = { -44.00, -2.97, -8.00 },
            building = { -47.10, -2.97, -19.80 }
        },
        Blue   = {
            pay      = { -16.50, -2.97, -7.50 },
            role     = { -25.00, -2.97, -8.00 },
            text     = textBlue,
            color    = "Blue",
            board    = playerBoardBlue,
            assign   = { -29.00, -2.97, -8.00 },
            governor = { -22.00, -2.97, -8.00 },
            building = { -25.10, -2.97, -19.80 }
        },
        White  = {
            pay      = { 5.50, -2.97, -7.50 },
            role     = { -3.06, -2.97, -7.99 },
            text     = textWhite,
            color    = "White",
            board    = playerBoardWhite,
            assign   = { -7.06, -2.97, -8.00 },
            governor = { -0.06, -2.97, -7.99 },
            building = { -3.10, -2.97, -19.80 }
        },
        Orange = {
            pay      = { 27.50, -2.97, -7.50 },
            role     = { 19.00, -2.97, -8.00 },
            text     = textOrange,
            color    = "Orange",
            board    = playerBoardOrange,
            assign   = { 15.00, -2.97, -8.00 },
            governor = { 22.00, -2.97, -8.00 },
            building = { 18.90, -2.97, -19.80 }
        },
        Brown  = {
            pay      = { 49.50, -2.97, -7.50 },
            role     = { 41.00, -2.97, -8.00 },
            text     = textBrown,
            color    = "Brown",
            board    = playerBoardBrown,
            assign   = { 37.00, -2.97, -8.00 },
            governor = { 44.00, -2.97, -8.00 },
            building = { 40.90, -2.97, -19.80 }
        }
    }


    -- 运输船列表
    shipList = { cargo4, cargo5, cargo6, cargo7, cargo8 }

    topShip  = shipList[#getSeatedPlayers() - 0]
    midShip  = shipList[#getSeatedPlayers() - 1]
    botShip  = shipList[#getSeatedPlayers() - 2]
end

-- 建筑列表
buildingList = {
    SmallIndigoPlant = { circle = 1, score = 1 },
    LargeIndigoPlant = { circle = 3, score = 2 },
    SmallSugarMill   = { circle = 1, score = 1 },
    LargeSugarMill   = { circle = 3, score = 2 },
    TobaccoBarn      = { circle = 3, score = 3 },
    CoffeeRoaster    = { circle = 2, score = 3 },
    SmallMarket      = { circle = 1, score = 1 },
    ConstructionHut  = { circle = 1, score = 1 },
    Hacidena         = { circle = 1, score = 1 },
    SmallWarehouse   = { circle = 1, score = 1 },
    BoardingHouse    = { circle = 1, score = 2 },
    CommercialOffice = { circle = 1, score = 2 },
    LargeMarket      = { circle = 1, score = 2 },
    LargeWarehouse   = { circle = 1, score = 2 },
    Factory          = { circle = 1, score = 3 },
    Harbor           = { circle = 1, score = 3 },
    University       = { circle = 1, score = 3 },
    Wharf            = { circle = 1, score = 3 },
    CityHall         = { circle = 1, score = 4 },
    GuildHall        = { circle = 1, score = 4 },
    CustomsHouse     = { circle = 1, score = 4 },
    Residence        = { circle = 1, score = 4 },
    Fortress         = { circle = 1, score = 4 }
}

-- 角色初始坐标
rolePos = {
    Craftsman   = { -8.20, -2.97, 5.67 },
    Builder     = { -8.20, -2.97, 0.98 },
    Prospector1 = { -8.20, -2.97, 15.05 },
    Prospector2 = { -11.25, -2.97, 15.05 },
    Trader      = { -8.20, -2.97, 10.36 },
    Mayor       = { -11.25, -2.97, 5.67 },
    Settler     = { -11.25, -2.92, 0.98 },
    Captain     = { -11.25, -2.97, 10.36 }
}

-- 货物列表
goodsList = {
    { tag = "None",    color = "Grey" },
    { tag = "Corn",    color = "Yellow" },
    { tag = "Indigo",  color = "Blue" },
    { tag = "Sugar",   color = "White" },
    { tag = "Tobacco", color = "Brown" },
    { tag = "Coffee",  color = "Black" }
}

-- 加载
function onLoad()
    -- 初始化
    init()
    -- 总督
    governor.createButton({
        click_function = "setup",
        position       = { 0, 0.1, 0.75 },
        width          = 600,
        height         = 240,
        font_size      = 200,
        label          = "setup"
    })
    -- 勘探者1
    prospector1.createButton({
        click_function = "takeProspector",
        position       = { 0, 0.1, 0.75 },
        width          = 600,
        height         = 240,
        font_size      = 200,
        label          = "take"
    })
    -- 勘探者2
    prospector2.createButton({
        click_function = "takeProspector",
        position       = { 0, 0.1, 0.75 },
        width          = 600,
        height         = 240,
        font_size      = 200,
        label          = "take"
    })
    -- 船长
    captain.createButton({
        click_function = "takeCaptain",
        position       = { 0, 0.1, 0.75 },
        width          = 600,
        height         = 240,
        font_size      = 200,
        label          = "take"
    })
    -- 商人
    trader.createButton({
        click_function = "takeTrader",
        position       = { 0, 0.1, 0.75 },
        width          = 600,
        height         = 240,
        font_size      = 200,
        label          = "take"
    })
    -- 市长
    mayor.createButton({
        click_function = "takeMayor",
        position       = { 0, 0.1, 0.75 },
        width          = 600,
        height         = 240,
        font_size      = 200,
        label          = "take"
    })
    -- 工匠
    craftsman.createButton({
        click_function = "takeCraftsman",
        position       = { -0.19, 0.1, 0.75 },
        width          = 420,
        height         = 240,
        font_size      = 200,
        label          = "take"
    })
    craftsman.createButton({
        click_function = "nextGoods",
        position       = { 0.41, 0.1, 0.75 },
        width          = 210,
        height         = 240,
        color          = Color.Grey,
        hover_color    = Color.Grey,
        press_color    = Color.Grey
    })
    -- 开拓者
    settler.createButton({
        click_function = "takeSettler",
        position       = { 0, 0.1, 0.75 },
        width          = 600,
        height         = 240,
        font_size      = 200,
        label          = "take"
    })
    -- 建筑师
    builder.createButton({
        click_function = "take",
        position       = { 0, 0.1, 0.75 },
        width          = 600,
        height         = 240,
        font_size      = 200,
        label          = "take"
    })
    -- 玩家Yellow
    playerBoardYellow.createButton({
        click_function = "pay",
        position       = { 1.55, 0.1, -1.1 },
        font_size      = 100,
        label          = "※"
    })
    -- 玩家Blue
    playerBoardBlue.createButton({
        click_function = "pay",
        position       = { 1.55, 0.1, -1.1 },
        font_size      = 100,
        label          = "※"
    })
    -- 玩家White
    playerBoardWhite.createButton({
        click_function = "pay",
        position       = { 1.55, 0.1, -1.1 },
        font_size      = 100,
        label          = "※"
    })
    -- 玩家Orange
    playerBoardOrange.createButton({
        click_function = "pay",
        position       = { 1.55, 0.1, -1.1 },
        font_size      = 100,
        label          = "※"
    })
    -- 玩家Brown
    playerBoardBrown.createButton({
        click_function = "pay",
        position       = { 1.55, 0.1, -1.1 },
        font_size      = 100,
        label          = "※"
    })
end

-- 获取区域中指定标签对象列表
function getObjListFromZoneWithTag(zone, tag)
    local objList = {}
    for _, obj in pairs(zone.getObjects(true)) do
        if obj.hasTag(tag) then
            table.insert(objList, obj)
        end
    end
    return objList
end

-- 勘探者
function takeProspector(obj, color)
    take(obj, color)
    obj.editButton({
        click_function = "doubloon",
        font_size      = 100,
        label          = "doubloon"
    })
end

-- 勘探者特权
function doubloon(obj, color)
    obj.editButton {
        click_function = "takeProspector",
        font_size      = 200,
        label          = "take"
    }
    bag1Doubloon.takeObject({ position = playerList[color].assign })
end

-- 船长
function takeCaptain(obj, color)
    take(obj, color)
    obj.editButton({
        click_function = "clearShip",
        label          = "clear"
    })
end

-- 清理运输船
function clearShip(obj, color)
    obj.editButton({
        click_function = "takeCaptain",
        label          = "take"
    })
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
end

-- 商人
function takeTrader(obj, color)
    take(obj, color)
    obj.editButton({
        click_function = "clearTradingHouse",
        label          = "clear"
    })
end

-- 清理交易所
function clearTradingHouse(obj, color)
    obj.editButton({
        click_function = "takeTrader",
        label          = "take"
    })
    -- 清空交易所如果已满
    local tradingHouseGoodsList = getObjListWithTrade(tradingHouse)
    if #tradingHouseGoodsList == 4 then
        recycleWithName(tradingHouseGoodsList)
    end
end

-- 市长
function takeMayor(obj, color)
    take(obj, color)
    obj.editButton({
        click_function = "assignColonists",
        label          = "assign"
    })
end

-- 工匠
function takeCraftsman(obj, color)
    take(obj, color)
    obj.editButton({
        click_function = "produce",
        font_size      = 100,
        label          = "produce"
    })
end

-- 开拓者
function takeSettler(obj, color)
    take(obj, color)
    obj.editButton({
        click_function = "clearPlantation",
        label          = "clear"
    })
end

-- 清理农场
function clearPlantation(obj, color)
    obj.editButton({
        click_function = "takeSettler",
        label          = "take"
    })
    -- 弃牌区坐标
    local pos = { x = 20, y = 2, z = 10 }
    -- 清理农场
    local hitLits = getHitListByBoxCast({ 2.00, -2.97, 18.50 }, { 11, 5, 1 })
    local objList = filterListByTag(hitLits, "chip remain")
    for _, obj in ipairs(objList) do
        obj.removeTag("chip remain")
        obj.addTag("chip ignore")
        obj.setPositionSmooth(pos, false, true)
    end
    -- 整理农场
    local plantationList = getObjectsWithTag("chip ignore")
    for i = 1, #plantationList do
        plantationList[i].setPositionSmooth({
            pos.x + i % 5 * 2,
            pos.y,
            pos.z - i / 5 * 2
        }, false, true)
    end
    -- 补充农场
    supplyPlantation()
end

-- 拿取角色
take = function(obj, color)
    if obj ~= nil and obj.hasTag("role remain") then
        -- 替换标签
        obj.removeTag("role remain")
        obj.addTag("role select")
        -- 移动 role 至玩家角色区
        obj.setPositionSmooth(playerList[color].role, false, true)
        -- 碰撞检测
        local hitList = Physics.cast({
            origin       = obj.getPosition(),
            direction    = { 0, 1, 0 },
            max_distance = 5
        })
        -- 移动 hitList 至玩家分配区
        for _, element in ipairs(hitList) do
            moveObjToPos(element.hit_object, playerList[color].assign)
        end
    end
end


-- 设置
function setup(obj)
    -- 玩家颜色列表
    colorList = { "Yellow", "Blue", "White", "Orange", "Brown" }
    playerColorList = {}
    for _, player in ipairs(colorList) do
        for _, color in ipairs(getSeatedPlayers()) do
            if player == color then
                table.insert(playerColorList, color)
            end
        end
    end
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
    -- 编辑按钮
    obj.editButton({
        index          = 0,
        click_function = "nextAnnual",
        position       = { 0, 0.1, 0.75 },
        font_size      = 200,
        label          = "next"
    })
    -- 回收货物 & 殖民 & 农场
    recycleWithName(getObjectsWithTag("goods"))
    recycle(bagColonist, getObjectsWithTag("colonists"))
    local hitLits = getHitListByBoxCast({ 1.00, -2.97, 18.50 }, { 10, 5, 1 })
    local objList = filterListByTag(hitLits, "plantation")
    recycle(bagPlantation, objList)
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
    -- 定时函数：显示玩家分数&财富
    Wait.time(
        function()
            for _, color in ipairs(playerColorList) do
                calcScoreAndMoney(color)
            end
        end,
        3, -1
    )
    -- 定时函数：显示殖民船殖民数
    Wait.time(
        function()
            local objList = {}
            for _, obj in ipairs(colonistShipZone.getObjects(true)) do
                if obj.hasTag("colonists") then
                    table.insert(objList, obj)
                end
            end
            textColonist.setValue(tostring(#objList))
        end,
        2, -1
    )
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
        obj.removeTag("chip ignore")
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
    if #bagColonist.getObjects() < num then
        return true
    end
    for i = 1, num do
        takeObjToPos(bagColonist, colonistHouse.getPosition())
    end
end

-- 从容器中取出对象至指定坐标附近
function takeObjToPos(container, pos)
    container.takeObject({
        position = {
            pos[1] + math.random() - 1,
            math.random() + 1,
            pos[3] + math.random() - 1
        }
    })
end

-- 移动对象至指定坐标附近
function moveObjToPos(obj, pos)
    obj.setPositionSmooth(
        {
            pos[1] + math.random() - 1,
            math.random() + 1,
            pos[3] + math.random() - 1
        },
        false, true)
end

-- 补充农场
function supplyPlantation()
    if #bagPlantation.getObjects() < #playerColorList + 1 then
        recycle(bagPlantation, getObjectsWithTag("chip ignore"))
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
function nextAnnual(obj, currColor)
    -- 移动 governor 至下一位玩家
    local nextColor = getNextColor(currColor)
    obj.setPositionSmooth(playerList[nextColor].governor, false, true)
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
end

-- 获取运输船对象列表
function getObjListWithShip(ship)
    -- 非空校验
    if ship == nil then
        return {}
    end
    -- 碰撞检测
    local hitList = getHitListByBoxCast(ship.getPosition(), { 4, 2, 2 })
    -- 标签过滤
    return filterListByTag(hitList, "goods")
end

-- 获取交易所对象列表
function getObjListWithTrade(obj)
    local hitList = getHitListByBoxCast(obj.getPosition(), { 2, 2, 4 })
    return filterListByTag(hitList, "goods")
end

-- 碰撞检测获取碰撞列表
function getHitListByBoxCast(pos, size)
    local hitList = Physics.cast({
        origin       = pos,
        direction    = { 0, 1, 0 },
        type         = 3,
        size         = size,
        max_distance = 0
    })
    local objList = {}
    for _, hitObj in ipairs(hitList) do
        table.insert(objList, hitObj.hit_object)
    end
    return objList
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
    obj.editButton({
        click_function = "supplyColonists",
        label          = "supply"
    })
    -- 市长特权
    if #bagColonist.getObjects() ~= 0 then
        bagColonist.takeObject({ position = playerList[color].assign })
    end
    -- 分配殖民
    local objList = getObjListFromZoneWithTag(colonistShipZone, "colonists")
    for _, obj in ipairs(objList) do
        moveObjToPos(obj, playerList[color].assign)
        color = getNextColor(color)
    end
end

-- 补充殖民
function supplyColonists(obj)
    obj.editButton({
        click_function = "takeMayor",
        label          = "take"
    })
    -- 计算建筑区空缺与殖民总数
    local cnt = countCirclesAndColonistsWithGlobal()
    -- 差值 > 玩家数 ? 差值 : 玩家数
    local num = math.max(cnt.circles - cnt.colonists, #playerColorList)
    -- 补充殖民
    if supplyColonistsWithNum(num) then
        broadcastToAll("game over!", Color.White)
    end
end

-- 计算全局建筑物空缺与殖民数量
function countCirclesAndColonistsWithGlobal()
    local circles, colonists
    for _, color in ipairs(playerColorList) do
        local cnt = countCirclesAndColonistsWithColor(color)
        circles = (circles or 0) + (cnt.circles or 0)
        colonists = (colonists or 0) + (cnt.colonists or 0)
    end
    return { circles = circles, colonists = colonists }
end

-- 计算玩家建筑物空缺与殖民数量
function countCirclesAndColonistsWithColor(color)
    local circles, colonists
    local objList = getObjListFromBuildWithColor(color)
    for _, obj in ipairs(objList) do
        if obj.hasTag("colonists") then
            colonists = (colonists or 0) + 1
        end
        if obj.hasTag("small building") or obj.hasTag("large building") then
            circles = (circles or 0) + buildingList[string.gsub(obj.getName(), "%s", "")].circle
        end
    end
    return { circles = circles, colonists = colonists }
end

-- 获取玩家建筑区对象列表
function getObjListFromBuildWithColor(color)
    -- 碰撞检测
    local hitList = getHitListByBoxCast(playerList[color].building, { 10.9, 5, 5 })
    -- 标签过滤
    local smallBuildList = filterListByTag(hitList, "small building")
    local largeBuildList = filterListByTag(hitList, "large building")
    local colonistList = filterListByTag(hitList, "colonists")

    return concatList(concatList(smallBuildList, largeBuildList), colonistList)
end

-- 拼接表
function concatList(a, b)
    for _, obj in ipairs(b) do
        table.insert(a, obj)
    end
    return a
end

-- 生产
function produce(obj, color)
    obj.editButton({
        click_function = "takeCraftsman",
        font_size = 200,
        label = "take"
    })
    -- 工匠特权
    for i = 2, #goodsList do
        if obj.hasTag(goodsList[i].tag) and #getBagWithName(goodsList[i].tag).getObjects() ~= 0 then
            takeObjToPos(getBagWithName(goodsList[i].tag), playerList[color].assign)
        end
    end
    -- 遍历玩家分配货物
    for i = 1, #playerColorList do
        for i = 2, #goodsList do
            local tag = goodsList[i].tag
            local num = math.min(#getBagWithName(tag).getObjects(), calcBeltlineWithTag(color, tag))
            assignGoodsWithNum(getBagWithName(tag), color, num)
        end
        color = getNextColor(color)
    end
end

-- 计算指定玩家指定标签生效产线数量
function calcBeltlineWithTag(color, tag)
    local plantationNum, buildingNum
    -- 碰撞检测
    local hitList = getHitListByBoxCast(playerList[color].board.getPosition(), { 18, 5, 12 })
    -- 标签过滤
    local plantationList = filterListByTag(filterListByTag(hitList, "plantation"), tag)
    -- 循环碰撞检测并计数
    for _, plantation in ipairs(plantationList) do
        local castList = getHitListByBoxCast(plantation.getPosition(), { 1.5, 1.5, 1.5 })
        plantationNum = (plantationNum or 0) + #filterListByTag(castList, "colonists")
    end
    -- 标签过滤
    local buildingList = filterListByTag(filterListByTag(hitList, "small building"), tag)
    -- 循环碰撞检测并计数
    for _, building in ipairs(buildingList) do
        local castList = getHitListByBoxCast(building.getPosition(), { 2.5, 1.5, 1.5 })
        buildingNum = (buildingNum or 0) + #filterListByTag(castList, "colonists")
    end

    if tag == "Corn" then
        return plantationNum or 0
    else
        return math.min(plantationNum or 0, buildingNum or 0)
    end
end

-- 指定玩家分配指定数量的货物
function assignGoodsWithNum(container, color, num)
    if num == 0 then
        return nil
    end
    for i = 1, num do
        takeObjToPos(container, playerList[color].assign)
    end
end

-- 回收 doubloon
function pay(obj, color)
    -- 碰撞检测
    local hitList = getHitListByBoxCast(playerList[color].pay, { 8, 8, 6 })
    -- 回收资源
    recycle(bag1Doubloon, filterListByTag(hitList, "Doubloon1"))
    recycle(bag5Doubloon, filterListByTag(hitList, "Doubloon5"))
    recycleWithName(filterListByTag(hitList, "goods"))
end

-- 通过标签过滤列表
function filterListByTag(hitList, tag)
    local objList = {}
    for _, hit in ipairs(hitList) do
        if hit.hasTag(tag) then
            table.insert(objList, hit)
        end
    end
    return objList
end

-- 计算分数&财富
function calcScoreAndMoney(color)
    -- 碰撞检测
    local hitList = getHitListByBoxCast(playerList[color].board.getPosition(), { 20, 5, 20 })
    -- 标签过滤并计算分数
    local score = #filterListByTag(hitList, "VP1") + #filterListByTag(hitList, "VP5") * 5
    for _, obj in ipairs(filterListByTag(hitList, "small building")) do
        score = score + buildingList[string.gsub(obj.getName(), "%s", "")].score
    end
    for _, obj in ipairs(filterListByTag(hitList, "large building")) do
        score = score + buildingList[string.gsub(obj.getName(), "%s", "")].score
    end
    -- 标签过滤并计算财富
    local money = #filterListByTag(hitList, "Doubloon1") + #filterListByTag(hitList, "Doubloon5") * 5
    -- 文本显示
    playerList[color].text.setValue("score: " .. tostring(score) .. "    " .. "money: " .. tostring(money))
end

-- 下一种货物
function nextGoods(obj)
    for i = 1, #goodsList do
        if obj.hasTag(goodsList[i].tag) then
            -- 替换标签
            obj.removeTag(goodsList[i].tag)
            obj.addTag(goodsList[i % #goodsList + 1].tag)
            -- 删除按钮
            obj.removeButton(1)
            -- 创建按钮
            obj.createButton({
                click_function = "nextGoods",
                position       = { 0.41, 0.1, 0.75 },
                width          = 210,
                height         = 240,
                color          = Color.fromString(goodsList[i % #goodsList + 1].color),
                hover_color    = Color.fromString(goodsList[i % #goodsList + 1].color),
                press_color    = Color.fromString(goodsList[i % #goodsList + 1].color)
            })
            return
        end
    end
end
