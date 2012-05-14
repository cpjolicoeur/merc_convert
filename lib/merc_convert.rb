# http://dev.openlayers.org/releases/OpenLayers-2.7/doc/apidocs/files/OpenLayers/Layer/SphericalMercator-js.html
# http://dev.openlayers.org/releases/OpenLayers-2.7/lib/OpenLayers/Layer/SphericalMercator.js

class MercConvert
  MAXEXTENT     = 20037508.34
  
  class << self
    include Math

    def inverse(x, y)
      lon = (x / MAXEXTENT) * 180
      lat = (y / MAXEXTENT) * 180
      lat = 180/PI * (2 * atan(exp(lat * PI / 180)) - PI / 2)
      
      [lon, lat]
    end
    
    def forward(lon, lat)
      x = lon * MAXEXTENT / 180
      y = log(tan((90+lat) * PI / 360)) / (PI / 180)
      y = y * MAXEXTENT / 180
      
      [x, y]
    end
  end
end