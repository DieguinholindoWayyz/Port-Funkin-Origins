local rings = 0
local ringMechanic = true


-- actually y'know what, rank based on score
local rank = ''
local ranks = {
    {'F', 0},
    {'E', 47500},
    {'D', 75500},
    {'C', 125000},
    {'B', 197500},
    {'A', 215000}
}

-- no more spamming!11!!
local canPressTAB = true

-- tails where the bitches' at?

CardIn = "yes"
UIBP = 1

function onCreate()
    if (downscroll == true) then
        UI2BP = -110

        RTBP = 110
        STBP = 160
        ATBP = 210

        UIBPX = 0
        UIBP = -100

        ThatThing = -30

        if (middlescroll == true) then
            yPos = 75
            EMBLY = 0

            rankY = 80
        else
            yPos = 600
            EMBLY = 525

            rankY = 605
        end
    else
        ThatThing = -30

        ATBP = 625
        STBP = 575
        RTBP = 525

        UI2BP = 290

        UIBPX = -25
        UIBP = 325

        if (middlescroll == true) then
            yPos = 600
            EMBLY = 525

            rankY = 605
        else
            yPos = 75
            EMBLY = 0

            rankY = 80
        end
    end

    if (middlescroll == true) then
        xPos = 825
        EMBLX = 465

        rankX = 1065
    else
        xPos = 360
        EMBLX = 0

        rankX = 600
    end

    makeLuaSprite("UI2", "ui/UIelemnt2", ThatThing, UI2BP);
    setObjectCamera("UI2", "hud")
    scaleObject("UI2", 0.5, 0.5)
    addLuaSprite("UI2", true)
    setProperty('UI2.alpha', 0)

    makeLuaSprite("UIe", "ui/UIelemnt", UIBPX, UIBP);
    setObjectCamera("UIe", "hud");
    scaleObject("UIe", 0.75, 0.75)
    addLuaSprite("UIe", true)

    --DEBUG STUFF REMOVE
    --thank you past egg for reminding present egg to do that :D   

    makeLuaText('ringCounter', '', 450, -40, RTBP)
    setTextSize('ringCounter', 45)
    setTextFont('ringCounter',"NiseSegaSonic.ttf")
    addLuaText('ringCounter')

    makeLuaText('scoreTxt2', '', 450, -40, STBP)
    setTextSize('scoreTxt2', 45)
    setTextFont('scoreTxt2',"NiseSegaSonic.ttf")
    addLuaText('scoreTxt2')

    makeLuaText('accTxt', '', 550,-35, ATBP)
    setTextSize('accTxt', 45)
    setTextFont('accTxt',"NiseSegaSonic.ttf")
    addLuaText('accTxt')

    makeLuaSprite("Emblem", "ui/RANKUI", EMBLX, EMBLY);
    addLuaSprite("Emblem", true)
    setObjectCamera("Emblem", "hud")

    makeLuaText('rankTxt', '', 550, xPos, yPos + 15)
    setTextSize('rankTxt', 55)
    setTextFont('rankTxt',"NiseSegaSonic.ttf")
    setTextColor('rankTxt','5b99ec')
    addLuaText('rankTxt')

    makeAnimatedLuaSprite('rankin', 'ui/RANKS', rankX, rankY)

    addAnimationByPrefix('rankin', 'animS', 'RANK-S')
    addAnimationByPrefix('rankin', 'animA', 'RANK-A')
    addAnimationByPrefix('rankin', 'animB', 'RANK-B')
    addAnimationByPrefix('rankin', 'animC', 'RANK-C')
    addAnimationByPrefix('rankin', 'animD', 'RANK-D')
    addAnimationByPrefix('rankin', 'animE', 'RANK-E')
    addAnimationByPrefix('rankin', 'animF', 'RANK-F')

    scaleObject("rankin", 0.9, 0.9)
    addLuaSprite('rankin', true)
    setObjectCamera('rankin', 'camHUD')
    setProperty('rankin.antialiasing', false)

    scaleObject("UI2", 0.5,0.5)
    scaleObject("UIe", 0.575, 0.575)

    setTextSize("ringCounter", 33.75)
    setTextSize("scoreTxt2", 33.75)
    setTextSize("accTxt", 33.75)

    precacheSound('ringLoss')
end

function onUpdate()
    setProperty('healthBar.visible', false)
    setProperty('healthBarBG.visible', false)
    setProperty('iconP1.visible', false)
    setProperty('iconP2.visible', false)
    setProperty('scoreTxt.visible', false)

    if (CardIn == "yes") then
        if (score > 0) then
            setProperty('scoreTxt2.x', getProperty('scoreTxt2.width') / math.ceil(score))
        elseif (rating > 0) then
            setProperty('accTxt.x', getProperty('accTxt.width') / truncateFloat(rating * 100, 2))
        end
    end

    setTextString('ringCounter', 'RINGS: ' ..rings)
    setTextString('scoreTxt2', 'SCORE: ' ..score)
    setTextString('accTxt', 'ACCURACY: ' ..truncateFloat(rating * 100, 2))

    setTextString('rankTxt', 'N/A')
    updateRank()

    setTextString("DEB", CardIn)

    if (getPropertyFromClass('flixel.FlxG', 'keys.justPressed.TAB') and canPressTAB == true) then
        canPressTAB = false

        if (CardIn == "yes") then
            CardIn = "no"

            doTweenX("UIeOut", "UIe", -1000, 0.5, "smoothStepInOut")
            doTweenX("scoreTxt2Out", "scoreTxt2", -600, 0.5, "smoothStepInOut")
            doTweenX("accTxt2Out", "accTxt", -600, 0.5, "smoothStepInOut")

            runTimer("RCGODOWN", 0.1,1)
            doTweenAlpha("aaable", "UI2", 100, 1)
        else
            CardIn = "yes"
            doTweenAlpha("aaable","UI2",0,0.4)

            doTweenX("UIeIn", "UIe", UIBPX, 0.5, "smoothStepInOut")
            doTweenX("scoreTxt2In", "scoreTxt2", -40, 0.5, "smoothStepInOut")
            doTweenX("accTxtIn", "accTxt", -15, 0.5, "smoothStepInOut")

            if (downscroll == false) then
                doTweenY("RcUp", "ringCounter", RTBP, 0.3, "smoothStepInOut")
                doTweenY("RcUiUp", "UI2", UI2BP, 0.3, "smoothStepInOut")
            end
        end

        runTimer('canPress', 0.75)
    end
end

function updateRank()
    totalPlayed = getPropertyFromClass('PlayState', 'instance.totalPlayed')
    if (totalPlayed < 1) then
        rank = 'N/A'
        setProperty('rankin.visible', false)
    else
        setProperty('rankin.visible', true)
        setProperty('rankTxt.visible', false)

        setTextSize('rankTxt', 75)
        if (score >= 262500) then
            rank = 'S'
            objectPlayAnimation('rankin', 'animS')

            if (middlescroll == true) then
                setProperty('rankin.x', 1050)
            else
                setProperty('rankin.x', 575)
            end
        else
            for i, scr in pairs(ranks) do
                if (score < scr[2]) then
                    rank = ranks[i][1]
                    objectPlayAnimation('rankin', 'anim' ..rank)
                    break
                end
            end
        end            
    end
end

function goodNoteHit(id, dir, type, sus)
    if (type == 'Ring' and sus == false and ringMechanic == true) then
        if (rings >= 0) then
            rings = rings + 1
        end
    end
    setProperty('health', 1)
end

function noteMiss(id, dir, type, sus)
    if (sus == false and ringMechanic == true) then
        if (rings > -1) then
            rings = rings - 5
            playSound('RingLoss', 0.7)

            if (rings < 0) then
                ringMechanic = false
                rings = -1
            end
        end
    end
    if (ringMechanic == true) then
        setProperty('health', 1)
    else
        setProperty('health', 0)
    end
end

function truncateFloat(number, precision)
    local num = number
    num = num * 10^precision
    num = math.floor(num) / 10^precision
    return num
end

function onTimerCompleted(tag,loops,loopsLeft)
    if (tag == "RCGODOWN") then
        if (downscroll == false) then
            doTweenY("RcDown", "ringCounter", RTBP + 100, 0.3, "smoothStepInOut")
            doTweenY("RcUiDown", "UI2", UI2BP + 120, 0.3, "smoothStepInOut") 
        end
    elseif (tag == 'canPress' and canPressTAB == false) then
        canPressTAB = true
    end
end

--there never was a UI 2 or 1 i thought it would be cool if it followed it :troll:
-- ui the sequel -SnoWaveDeveloper

function onStepHit()
    if (curStep == 1680) then 
        canPressTAB = false

        doTweenAlpha('text1', 'ringCounter', 0, 0.2)
        doTweenAlpha('text2', 'scoreTxt2', 0, 0.2)
        doTweenAlpha('text3', 'accTxt', 0, 0.2)

        doTweenY('text4', 'rankin', 300, 0.5, 'snoothStepInOut')
        doTweenY('UI4', 'Emblem', 215, 0.5, 'snoothStepInOut')

        if (middlescroll == false) then
            doTweenX('text4.1', 'rankin', 1065, 0.5, 'smoothStepInOut')
            doTweenX('UI4.1', 'Emblem', 465, 0.5, 'smoothStepInOut')
        end

        doTweenAlpha('ui1', 'UIe', 0, 0.2)
        doTweenAlpha('ui2', 'UI2', 0, 0.2)

        doTweenAlpha('time1', 'timeTxt', 0, 0.2)
        doTweenAlpha('time2', 'timeBar', 0, 0.2)
        doTweenAlpha('time3', 'timeBarBG', 0, 0.2)

        for i = 0, 7 do
            setPropertyFromGroup('playerStrums', i, 'alpha', 0)
            setPropertyFromGroup('opponentStrums', i, 'alpha', 0)
        end
	end 
end

---- ⠀⣠⠞⠉⢉⠩⢍⡙⠛⠋⣉⠉⠍⢉⣉⣉⣉⠩⢉⠉⠛⠲⣄⠀⠀⠀⠀
--⠀⠀⠀⡴⠁⠀⠂⡠⠑⠀⠀⠀⠂⠀⠀⠀⠀⠠⠀⠀⠐⠁⢊⠀⠄⠈⢦⠀⠀⠀
--⠀⣠⡾⠁⠀⠀⠄⣴⡪⠽⣿⡓⢦⠀⠀⡀⠀⣠⢖⣻⣿⣒⣦⠀⡀⢀⣈⢦⡀⠀
--⣰⠑⢰⠋⢩⡙⠒⠦⠖⠋⠀⠈⠁⠀⠀⠀⠀⠈⠉⠀⠘⠦⠤⠴⠒⡟⠲⡌⠛⣆
--⢹⡰⡸⠈⢻⣈⠓⡦⢤⣀⡀⢾⠩⠤⠀⠀⠤⠌⡳⠐⣒⣠⣤⠖⢋⡟⠒⡏⡄⡟
--⠀⠙⢆⠀⠀⠻⡙⡿⢦⣄⣹⠙⠒⢲⠦⠴⡖⠒⠚⣏⣁⣤⣾⢚⡝⠁⠀⣨⠞⠀
--⠀⠀⠈⢧⠀⠀⠙⢧⡀⠈⡟⠛⠷⡾⣶⣾⣷⠾⠛⢻⠉⢀⡽⠋⠀⠀⣰⠃⠀⠀
--⠀⠀⠀⠀⠑⢤⡠⢂⠌⡛⠦⠤⣄⣇⣀⣀⣸⣀⡤⠼⠚⡉⢄⠠⣠⠞⠁⠀⠀⠀
--⠀⠀⠀⠀⠀⠀⠉⠓⠮⣔⡁⠦⠀⣤⠤⠤⣤⠄⠰⠌⣂⡬⠖⠋⠀⠀⠀⠀⠀⠀
--⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠒⠤⢤⣀⣀⡤⠴⠒⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
