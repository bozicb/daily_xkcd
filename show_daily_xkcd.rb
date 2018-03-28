require 'tk'
require 'open-uri'
require 'net/http'

def download_image(url, dest)
  open(url) do |u|
    File.open(dest, 'wb') { |f| f.write(u.read) }
  end
end

$resultsVar = TkVariable.new
root = TkRoot.new
root.title = "Window"

image = TkPhotoImage.new
download_image("https://imgs.xkcd.com/comics/autogyros.png","/tmp/xkcd.png")
image.file = "/tmp/xkcd.png"

label = TkLabel.new(root) 
label.image = image
label.place('height' => image.height, 'width' => image.width)

Tk.mainloop
