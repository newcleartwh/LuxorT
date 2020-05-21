using Images, FileIO, Colors, Plots
using Luxor
img = load("Crop1.png")
imedge(img)
img_gray = Gray.(img)
imedge(img_gray)
save("crop1_grey.png")
save("crop1_grey.png", img_gray)
img2 = load("Crop2.png")
img_gray2 = Gray.(img2)
save("crop2_grey.png", img_gray2)
imedge(img_gray)
imedge(img_gray)[1]
size(imedge(img_gray)[1])
gx, gy, mag, or = imedge(img_gray)
maximum(or)
y,x = size(mag)
yarr =vcat([repeat([i],928) for i in 1:1774]...)
plot(repeat(1:928,1774),yarr,reshape(mag,(928*1774,)),st=:surface)
save("sobel1.png",mag)

function luxorIdea()
	origin()
	for y in 1:1774 
		for x in 1:928
			rule(Point(x, y), or[y,x])
			# vector field with Luxor using arrow
		end
	end
end
