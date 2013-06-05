class HashWithDoubleAccess < Ground::Activity

  def call
    str_h = access_with(data, :to_s)
    sym_h = access_with(data, :to_sym)
    sym_h.merge str_h
  end


  private

  def access_with(d, m)
    tmp_h = {}
    d.each {|k, v|
      if v.is_a? Hash
        tmp_h[k.send(m)] = access_with(v, m)
      elsif v.is_a? Array
        v_dup = v.dup
        v_dup.each_with_index {|item, index| v_dup[index] = access_with(item, m) if item.is_a? Hash}
        tmp_h[k.send(m)] = v_dup
      else
        tmp_h[k.send(m)] = v
      end
    }
    tmp_h
  end
  
end
