#
# I had a look at AspectR [1], and it looked awfully confusing.
# I then had a look at AOP on wikipedia [2], I think the people
# who contributed to that have possibly gone whacko. An excerpt:
#
# "Since the risk is to code written by others, code weaving can
#  be emotional for the authors of the original code. There is
#  little moral grounding to guide programmers in these matters
#  because morality isn't something often applied to coding practices"
#
# What??!
#
# Here is my non-academic completely morality-free implementation.
#
# See line 99 for the API. Feedback is appreciated.
#
# Ryan Allen (aspect@yeahnah.org)
#
# [1] http://aspectr.sourceforge.net/
# [2] http://en.wikipedia.org/wiki/Aspect-oriented_programming
#

module Aspect

  class << self

    def define(&aspects)
      instance_eval(&aspects)
    end

    def with_instance_of(klass)
      @class = klass
      @subject = :instance
      self
    end

    def with_class(klass)
      @class = klass
      @subject = :class
      self
    end

    def before(method_name, &perform_before)
      with_scope do
        method_prior = instance_method(method_name)
        define_method method_name do |*args|
          perform_before.call(self, *args)
          method_prior.bind(self).call(*args)
        end
      end
    end

    def after(method_name, &perform_after)
      with_scope do
        method_prior = instance_method(method_name)
        define_method method_name do |*args|
          return_value = method_prior.bind(self).call(*args)
          perform_after.call(self, *args)
          return_value
        end
      end
    end

    def with_scope(&code)
      if @subject == :class
        @class.class_eval { class << self; self; end }.instance_eval(&code)
      else
        @class.class_eval(&code)
      end
    end

  end

end