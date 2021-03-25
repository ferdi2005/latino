module ApplicationHelper
    def flash_icon(level)
        case level
            when :notice then "info"
            when :success then "success"
            when :error then "warning"
            when :alert then "info"
            else "info"
        end
    end    
end
