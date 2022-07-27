function onCreate()
    makeLuaSprite('background1', 'bg/GRb', -690, -375)
    scaleObject('background1', 0.5, 0.5)
    setScrollFactor('background1', 0.65, 0.65)
    addLuaSprite('background1', false)

    makeLuaSprite('background2', 'bg/GRm', -690, -400)
    scaleObject('background2', 0.5, 0.5)
    setScrollFactor('background2', 0.8, 0.8)
    addLuaSprite('background2', false)

    makeLuaSprite('flowers', 'bg/GRfl', -775, -400)
    scaleObject('flowers', 0.5, 0.5)
    addLuaSprite('flowers', false)

    makeLuaSprite('foreground', 'bg/GRf', -775, -400)
    scaleObject('foreground', 0.5, 0.5)
    addLuaSprite('foreground', false)

    makeAnimatedLuaSprite('flickies', 'bg/flikies', 50, 0)
    addAnimationByPrefix('flickies', 'idle', 'GF Dancing Beat', 24, true)
    scaleObject('flickies', 0.55, 0.55)
    
    addLuaSprite('flickies', false)

    makeLuaSprite('bg4', '', -905, -540);
    makeGraphic('bg4', 4500, 4500,'000000')
    addLuaSprite('bg4', false);
    setProperty('bg4.alpha', 0)

    allowZoom = true
end

function onUpdate(elapsed)
    if (allowZoom == true) then
        if (mustHitSection) then
            setProperty('defaultCamZoom', 1)
        else
            setProperty('defaultCamZoom', 0.85)
        end
    end
end

function onEvent(name, v1, v2)
    if (name == 'DarkMoment') then
        if (v1 ~= '') then
            doTweenAlpha('tag1', 'bg4', 0.65, tonumber(v2))
            allowZoom = false
        else
            doTweenAlpha('tag1', 'bg4', 0, tonumber(v2))
            allowZoom = true
        end
    end
end

