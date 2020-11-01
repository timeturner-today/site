module Jekyll
    class TweetShareTag < Liquid::Tag
        # include all URL filters from Jekyll
        include Jekyll::Filters::URLFilters
        # include all standard liquid filters
        include Liquid::StandardFilters

        def initialize(tag_name, text, tokens)
            super
            @text = text.strip!
        end
        
        def render(context)
            # required for URLFilters
            @context = context
            
            # site/page context vars
            handle = context.environments.first["site"]["author"]["twitter"]
            title = context.environments.first["page"]["title"]
            hash_tags = context.environments.first["page"]["tags"].map { |t| "##{t}" }.join(" ")

            # Build vars for url
            url = url_encode(absolute_url(context.environments.first["page"]["url"]))
            tweet_text = url_encode(strip_html("#{@text} from #{title} #{hash_tags}"))

            "<blockquote class=\"twitter-tweet\" data-lang=\"en\>" +
            "   <a class=\"twitter-tweet\" href=\"http://twitter.com/share?text=#{tweet_text}&amp;url=#{url}&amp;via=#{handle}\">" +
            "       #{@text}<small><span class=\"icon-twitter\" aria-hidden=\"true\"></span> Tweet To Share</small>" +
            "   </a>" +
            "</blockquote>"
        end

        private

        def config
            @config ||= @context.registers[:site].config
        end
    end

    class TweetShareTagBlock < Liquid::Block
        # include all URL filters from Jekyll
        include Jekyll::Filters::URLFilters
        # include all standard liquid filters
        include Liquid::StandardFilters
        
        def render(context)
            # required for URLFilters
            @context = context
            text = super
            
            # site/page context vars
            handle = context.environments.first["site"]["author"]["twitter"]
            title = context.environments.first["page"]["title"]
            hash_tags = context.environments.first["page"]["tags"].map { |t| "##{t}" }.join(" ")

            # Build vars for url
            url = url_encode(absolute_url(context.environments.first["page"]["url"]))
            tweet_text = url_encode(strip_html("#{text} from #{title} #{hash_tags}"))

            "<blockquote class=\"twitter-tweet\" data-lang=\"en\">" +
            "   <a class=\"twitter-tweet\" href=\"http://twitter.com/share?text=#{tweet_text}&amp;url=#{url}&amp;via=#{handle}\">" +
            "       #{text} <small><span class=\"icon-twitter\" aria-hidden=\"true\"></span> Tweet To Share</small>" +
            "   </a>" +
            "</blockquote>"
        end

        private

        def config
            @config ||= @context.registers[:site].config
        end
    end
end

Liquid::Template.register_tag('tweet', Jekyll::TweetShareTag)
Liquid::Template.register_tag('tweetblock', Jekyll::TweetShareTagBlock)