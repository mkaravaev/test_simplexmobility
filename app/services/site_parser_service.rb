class SiteParserService
  attr_accessor :context, :strategy

  def initialize(options, strategy)
    @context = options
    @strategy = strategy
  end

  def run
    result = []
    @context.each do |context|
      result << @strategy.run(context)
    end
    result = result.flatten
  end

end

