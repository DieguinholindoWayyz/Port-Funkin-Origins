function onCreatePost()
    makeLuaSprite('blackBlend', '', 0, 0)
    makeGraphic('blackBlend', 1280, 720, '000000')
    setObjectCamera('blackBlend', 'camHUD')
    setProperty('blackBlend.alpha', 0.55)

    makeLuaSprite('topborder', 'ui/teaser/topBorder', -25, -720)
    setObjectCamera('topborder', 'camHUD')

    makeLuaSprite('bottomborder', 'ui/teaser/downBorder', 255, 720)
    setObjectCamera('bottomborder', 'camHUD')

    for tLines = 0, 1 do
        makeLuaSprite('topquotes' ..tLines, 'ui/teaser/line' ..tLines, 1500, 105 + (tLines * 35))
        scaleObject('topquotes' ..tLines, 0.115, 0.115)
        setObjectCamera('topquotes' ..tLines, 'camHUD')
    end
    for bLines = 2, 3 do
        makeLuaSprite('bottomquotes' ..bLines, 'ui/teaser/line' ..bLines, -2000, 425 + (bLines * 50))
        scaleObject('bottomquotes' ..bLines, 0.1, 0.1)
        setObjectCamera('bottomquotes' ..bLines, 'camHUD')

        if (bLines == 3) then
            setProperty('bottomquotes' ..bLines.. '.scale.x', 0.225)
            setProperty('bottomquotes' ..bLines.. '.scale.y', 0.225)
        end
    end

    makeLuaSprite('logo', 'ui/teaser/logo', 375, 185)
    scaleObject('logo', 1.1, 1.1)
    setObjectCamera('logo', 'camHUD')
    setProperty('logo.alpha', 0)

    makeLuaText('15Txt', '1.5 is under development! \n\nStay tuned to what will come next...', 1175, -50, 275)
    setTextSize('15Txt', 45)
    setTextFont('15Txt',"NiseSegaSonic.ttf")
    addLuaText('15Txt')
    setProperty('15Txt.alpha', 0)
end

function onStepHit()
    if (curStep == 1680) then 
        addLuaSprite('blackBlend', false)
        addLuaSprite('bottomborder', false)
        addLuaSprite('topborder', false)
        addLuaSprite('logo', false)
        for i = 0, 1 do
            addLuaSprite('topquotes' ..i, false)
            for j = 2, 3 do
                addLuaSprite('bottomquotes' ..j, false)
            end
        end

        runTimer('tween', 0.3)
	end 
end

function onTimerCompleted(tag, l, ll)
    if (tag == 'tween') then
        doTweenY('tb', 'topborder', -50, 0.4, 'smoothstepinout')
        doTweenY('bb', 'bottomborder', 575, 0.4, 'smoothstepinout')
        for i = 0, 1 do
            if (i == 1) then
                doTweenX('tl' ..i, 'topquotes' ..i, 325, 0.7, 'expoinout')
            else
                doTweenX('tl' ..i, 'topquotes' ..i, 255, 0.7, 'expoinout')
            end
            for j = 2, 3 do
                if (i == 3) then
                    doTweenX('bl' ..j, 'bottomquotes' ..j, 445, 0.7, 'expoinout')
                else
                    doTweenX('bl' ..j, 'bottomquotes' ..j, 440, 0.7, 'expoinout')
                end
            end
        end
        doTweenAlpha('rotw', 'logo', 1, 0.775)

        runTimer('1.5cominuphellyeah', 6.5)
    end

    if (tag == '1.5cominuphellyeah') then
        for i = 0, 1 do
            if (i == 1) then
                doTweenAlpha('tl' ..i, 'topquotes' ..i, 0, 0.5)
            else
                doTweenAlpha('tl' ..i, 'topquotes' ..i, 0, 0.5)
            end
            for j = 2, 3 do
                if (i == 3) then
                    doTweenAlpha('bl' ..j, 'bottomquotes' ..j, 0, 0.5)
                else
                    doTweenAlpha('bl' ..j, 'bottomquotes' ..j, 0, 0.5)
                end
            end
        end
        doTweenAlpha('rotw', 'logo', 0, 0.775)
        doTweenAlpha('staytuned', '15Txt', 1, 0.775)
    end
end