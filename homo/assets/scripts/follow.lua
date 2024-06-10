-- og script by cyn
-- improved by stilic for todd's fnf mod
--[[ setting stuffs ]]
following = true
local offsets = {dad = 6, boyfriend = 6}
local pivot_time = 0
--[[ internal stuffs ]]
local anims = {singL = true, singD = false, singU = false, singR = true}
local cur_char
local resetted_angle = false
local function reset_angle()
    if pivot_time > 0 and getProperty('camGame.angle') > 0 then
        doTweenAngle('follow_angle', 'camGame', 0, pivot_time, 'quadOut')
    end
end
local function follow(char, force_idle)
    if following and not getProperty('isCameraOnForcedPos') then
        cur_char = char
        resetted_angle = false
        local anim, offset = force_idle and 'idle' or
                                 getProperty(char .. '.animation.curAnim.name'):sub(
                                     1, 5), offsets[char]
        cameraSetTarget(char)
        if anims[anim] ~= nil then
            local pos_clone, horizontal = {
                getProperty('camFollow.x'), getProperty('camFollow.y')
            }, anims[anim]
            local dir_mult
            if horizontal then
                dir_mult = anim == 'singL' and -1 or 1
                pos_clone[1] = pos_clone[1] + offset * dir_mult
                if pivot_time > 0 then
                    doTweenAngle('follow_angle', 'camGame', 2.5 * -dir_mult,
                                 pivot_time, 'quadOut')
                end
            else
                dir_mult = anim == 'singU' and -1 or 1
                pos_clone[2] = pos_clone[2] + offset * dir_mult
                reset_angle()
            end
            setProperty('camFollow.x', pos_clone[1])
            setProperty('camFollow.y', pos_clone[2])
        else
            reset_angle()
        end
    else
        cur_char = nil
        if not resetted_angle then
            reset_angle()
            resetted_angle = true
        end
    end
end
local function get_section_char()
    if gfSection then
        return 'gf'
    elseif mustHitSection then
        return 'boyfriend'
    else
        return 'dad'
    end
end
function onCreatePost() onSectionHit() end
function onSectionHit() follow(get_section_char()) end
function onTimerCompleted(tag)
    if cur_char ~= nil and tag == 'follow_idle' then follow(cur_char, true) end
end
function goodNoteHit(id)
    if not getPropertyFromGroup('notes', id, 'noAnimation') then
        follow(get_section_char())
        local pitch = getPropertyFromClass(
                                'flixel.FlxG', 'sound.music.pitch')
        if not type(pitch) == 'number' then pitch = 1 end
        runTimer('follow_idle', stepCrochet * (0.0011 / pitch) *
                     getProperty(char .. '.singDuration') / 1.45)
    end
end
function opponentNoteHit(id) goodNoteHit(id) end
function onGameOver()
    reset_angle()
    return Function_Continue
end
