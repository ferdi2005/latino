module ApplicationHelper
    QUESTION_TYPES = ["multiple_choice", "completation"]

    def question_type(index)
        QUESTION_TYPES[index]
    end

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
