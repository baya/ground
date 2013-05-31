class HashWithDoubleAccess < Ground::Activity

  def call
    double_h = {}
    data.each {|k, v|
      if v.is_a?(Hash)
        double_h[k.to_sym] = access_with(v, :to_sym)
        double_h[k.to_s] =  access_with(v, :to_s)
      else
        double_h[k.to_sym] = double_h[k.to_s] =  v
      end
    }
    double_h
  end


  private
  
  def access_with(h, m)
    tmp_h = {}
    h.each {|k, v|
      v = access_with(v, m) if v.is_a? Hash
      tmp_h[k.send(m)] = v
    }
    tmp_h
  end
  
end
