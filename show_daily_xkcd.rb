require 'tk'
require 'open-uri'
require 'net/http'
require 'json'

def download_image(url, dest)
  open(url) do |u|
    File.open(dest, 'wb') { |f| f.write(u.read) }
  end
end

xkcd_json=JSON.parse(Net::HTTP.get(URI('https://xkcd.com/info.0.json')))


$resultsVar = TkVariable.new
root = TkRoot.new
root.title = "Window"

image = TkPhotoImage.new
download_image(xkcd_json['img'],"/tmp/xkcd.png")
image.file = "/tmp/xkcd.png"

label = TkLabel.new(root) 
label.image = image
label.place('height' => image.height, 'width' => image.width)

Tk.mainloop
