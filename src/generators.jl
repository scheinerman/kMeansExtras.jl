export double_normal_cluster, double_square_cluster, double_disc_cluster



"""
    double_normal_cluster(n::Int = 1000, offset = [3, 0])

Create a dataset based on two Gaussian normals in the plane
"""
function double_normal_cluster(n::Int = 1000, offset = [3, 0])
    p1 = [randn(2) for k = 1:n]
    p2 = [randn(2) + offset for k = 1:n]
    return [p1; p2]
end

"""
    double_square_cluster(n::Int = 1000, offset = [0.8, 0.8])

Create a dataset based on two uniforms in a unit square
"""
function double_square_cluster(n::Int = 1000, offset = [0.8, 0.8])
    p1 = [rand(2) for k = 1:n]
    p2 = [rand(2) + offset for k = 1:n]
    return [p1; p2]
end


function rand_in_disc()
    while true
        p = 2 * rand(2) - [1, 1]
        x, y = p
        if x * x + y * y <= 1
            return p
        end
    end
end

"""
    double_disc_cluster(n::Int = 1000, offset = [1.5, 0])

Create a dataset based on two discs.
"""
function double_disc_cluster(n::Int = 1000, offset = [1.5, 0])
    p1 = [rand_in_disc() for _ = 1:n]
    p2 = [rand_in_disc() + offset for _ = 1:n]
    return [p1; p2]
end
