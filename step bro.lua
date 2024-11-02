local fps = 12.05
local urls = {
  --{"URL", COLUMNS, ROWS},
    {"assets.prod.novaquark.com/65967/718c9cf3-fb11-4157-8d4a-d93a64fa8da3.jpg", 10, 19},
    {"assets.prod.novaquark.com/65967/01b1134a-3a5d-4bd0-910c-e813d389fb7d.jpg", 9, 19},
    {"assets.prod.novaquark.com/65967/e14efe6a-4ae4-4c8a-b18f-73a83c7f3732.jpg", 11, 17},
    {"assets.prod.novaquark.com/65967/fb713b04-8254-43a8-a8e6-1508ab94c0fb.jpg", 11, 16},
    {"assets.prod.novaquark.com/65967/c97abe06-b140-479a-970f-f8986809597c.jpg", 10, 19},
    {"assets.prod.novaquark.com/65967/06ccae3b-ec9e-453c-b89f-52b7f4206f13.jpg", 9, 19},
    {"assets.prod.novaquark.com/65967/f7886175-857a-4e16-89d9-d2022b54b4e8.jpg", 11, 17},
    {"assets.prod.novaquark.com/65967/23f76a8c-7881-4011-ae3c-ca04badc1b74.jpg", 11, 16},
    {"assets.prod.novaquark.com/65967/e0e78621-2e9b-4c6d-8574-ec0490d04c72.jpg", 11, 17},
    {"assets.prod.novaquark.com/65967/c363f944-d60f-4b23-9cf9-40956995b770.jpg", 11, 16},
    {"assets.prod.novaquark.com/65967/675dfd07-e05f-48e4-b016-b6a316c4d172.jpg", 13, 14},
    {"assets.prod.novaquark.com/65967/a8672336-5d37-420c-9128-475e01f64133.jpg", 7, 25},
    {"assets.prod.novaquark.com/65967/9b984131-be4e-4031-9cfc-0dca8f66f900.jpg", 9, 21},
    {"assets.prod.novaquark.com/65967/6440a85d-da0b-4c21-a06b-7315f16c1b4b.jpg", 11, 17},
    {"assets.prod.novaquark.com/65967/02f37288-6818-43a3-b57b-25138210f5a8.jpg", 9, 19},
    {"assets.prod.novaquark.com/65967/912eab70-3802-4d21-be0b-f9116069121d.jpg", 5, 20},
}

if not frameBuffer then
    frameBuffer = {}
    for k, v in ipairs(urls) do
        for r = 0, v[3]-1, 1 do
            for c = 0, v[2]-1, 1 do
                frameBuffer[#frameBuffer + 1] = {k,c,r}
            end
        end
    end
    totalFrames = #frameBuffer
end
local frames = frameBuffer

local rx, ry = getResolution()
local l = createLayer()

local frame = (math.floor(getTime() * fps) % totalFrames) + 1

local i = loadImage(urls[frames[frame][1]][1])
local i2 = loadImage(urls[((frames[frame][1] % #urls) + 1)][1])

local w, h = getImageSize(i)
local sx, sy = w / urls[frames[frame][1]][2], h / urls[frames[frame][1]][3]
logMessage(frames[frame][1].." / "..frames[frame][2].." / "..frames[frame][3])
addImageSub(l, i, 0, 0, rx, ry, frames[frame][2] * sx, frames[frame][3] * sy, sx, sy)

requestAnimationFrame(1)
