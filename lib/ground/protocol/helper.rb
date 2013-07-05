module Ground::Protocol
  
  module Helper

    Ridge = Ground::Ridge

    def help(*args, &p)
      if args.first == :all_states
        help *Ridge.states, &p
      else
        args.each {|obj|
          obj.class_eval &p if block_given?
        }
      end
    end

  end
  
end
