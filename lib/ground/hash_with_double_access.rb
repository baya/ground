class HashWithDoubleAccess < Ground::Activity

  def call
    double_h = {}
    data.each {|k, v|
      if v.is_a?(Hash)
        double_h[k.to_sym] = access(v, &:to_sym)
        double_h[k.to_s] =  access(v, &:to_s)
      else
        double_h[k.to_sym] = double_h[k.to_s] =  v
      end
    }
    double_h
  end


  private
  
  def access(h)
    tmp_h = {}
    h.each {|k, v|
      v = access(v) if v.is_a? Hash
      k = yield k
      tmp_h[k] = v
    }
    tmp_h
  end
  
end
