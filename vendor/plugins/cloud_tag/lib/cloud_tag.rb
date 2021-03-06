module CloudTag
  module Helpers
    def cloud_tag(tag_link_hash, height = "240", width="200")
      %(<embed width=#{width} height=#{height} flashvars="tcolor=0xff3333&amp;tcolor2=0xff3333&amp;hicolor=0xff5555&amp;tspeed=100&amp;distr=true&amp;mode=both&amp;tagcloud=#{all_tags(tag_link_hash)}" allowscriptaccess="always" wmode="transparent" quality="high" bgcolor="#666666" name="tagcloudflash" id="tagcloudflash" src="/flash/cloudtag.swf" type="application/x-shockwave-flash"/>)
    end
    
    def all_tags(tag_link_hash)
      %(<tags>#{cloud_tag_parts(tag_link_hash)}</tags>)
    end
    
    def cloud_tag_parts(tag_link_hash)
      r = ""
      tag_link_hash.each do |k, v|
        r << cloud_tag_part(k, v)
      end
      return r
    end
    
    def cloud_tag_part(t, l)
      %(<a href='#{l}' style='12' color='0xff3333' hicolor='0xffff00'>#{t}</a>)
    end
  end
end
