
export draw_partition

function draw_one_point(z::Vector, the_color = :red)
    draw_point(
        z[1],
        z[2],
        marker = 2,
        markerstrokecolor = the_color,
        markercolor = the_color,
    )
end

function draw_list(list::Vector, the_color = :red)
    for v in list
        draw_one_point(v, the_color)
    end
end

_color_list = [:blue, :red, :green, :cyan, :magenta, :black, :purple, :orange]
_n_colors = length(_color_list)


"""
    draw_partition(p::Dict{T,Int}) where {T}

Draw the output of `kmeans` in the plane using colors for the parts. 
"""
function draw_partition(p::Dict{T,Int}) where {T}

    if maximum(values(p)) > _n_colors
        error("Cannot show a partition with more than $_n_colors colors")
    end

    newdraw()
    for j in unique(values(p))
        sublist = [v for v in keys(p) if p[v] == j]
        draw_list(sublist, _color_list[j])
    end
    finish()
end