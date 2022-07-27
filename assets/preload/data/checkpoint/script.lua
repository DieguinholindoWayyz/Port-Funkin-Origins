local ofs = 50;

local xx = 135
local yy = 125

local xx2 = 340
local yy2 = 200

function onUpdate() 
    if (mustHitSection == false) then 
        if getProperty('dad.animation.curAnim.name') == 'singLEFT' or getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
            triggerEvent('Camera Follow Pos', xx - ofs, yy)
        end
        if getProperty('dad.animation.curAnim.name') == 'singRIGHT' or getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
            triggerEvent('Camera Follow Pos', xx + ofs, yy)
        end
        if getProperty('dad.animation.curAnim.name') == 'singUP' or getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
            triggerEvent('Camera Follow Pos', xx , yy - ofs)
        end
        if getProperty('dad.animation.curAnim.name') == 'singDOWN' or getProperty('dad.animation.curAnim.name') == 'singDOWN-alt'  then
            triggerEvent('Camera Follow Pos', xx , yy + ofs)
        end
        if getProperty('dad.animation.curAnim.name') == 'idle' or getProperty('dad.animation.curAnim.name') == 'idle-alt'  then
            triggerEvent('Camera Follow Pos', xx , yy)
        end
    else
        if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' or getProperty('boyfriend.animation.curAnim.name') == 'singLEFT-alt' then
            triggerEvent('Camera Follow Pos', xx2 - ofs, yy2)
        end
        if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' or getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT-alt' then
            triggerEvent('Camera Follow Pos', xx2 + ofs, yy2)
        end
        if getProperty('boyfriend.animation.curAnim.name') == 'singUP' or getProperty('boyfriend.animation.curAnim.name') == 'singUP-alt' then
            triggerEvent('Camera Follow Pos', xx2, yy2 - ofs)
        end
        if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' or getProperty('boyfriend.animation.curAnim.name') == 'singDOWN-alt' then
            triggerEvent('Camera Follow Pos', xx2, yy2 + ofs)
        end
        if getProperty('boyfriend.animation.curAnim.name') == 'idle' or getProperty('boyfriend.animation.curAnim.name') == 'idle-alt'  then
            triggerEvent('Camera Follow Pos', xx2, yy2)
        end
    end

    if (mustHitSection) then
        setProperty('defaultCamZoom', 0.9)
    else
        setProperty('defaultCamZoom', 0.75)
    end
end