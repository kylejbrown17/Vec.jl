const DUMMY_PRECISION = 1e-12

Base.isfinite(a::AbstractVec) = all(isfinite.(a))
Base.isinf(a::AbstractVec) = any(isinf.(a))

function StaticArrays.similar_type(::Type{V}, ::Type{F}, size::Size{N}) where {V<:AbstractVec, F, N}
    if size == Size(V) && eltype(V) == F
        return V
    else # convert back to SArray
        return SArray{Tuple{N...},F,length(size),prod(size)}
    end
end

function StaticArrays.similar_type(::Type{V}, ::Type{T}, size::Size{N}) where {V<:VecE2, T, N}
    if size == Size(V)
        return VecE2{T}
    else # convert back to SArray
        return SArray{Tuple{N...},T,length(size),prod(size)}
    end
end

function StaticArrays.similar_type(::Type{V}, ::Type{T}, size::Size{N}) where {V<:VecE3, T, N}
    if size == Size(V)
        return VecE3{T}
    else # convert back to SArray
        return SArray{Tuple{N...},T,length(size),prod(size)}
    end
end

function StaticArrays.similar_type(::Type{V}, ::Type{T}, size::Size{N}) where {V<:VecSE2, T, N}
    if size == Size(V)
        return VecSE2{T}
    else # convert back to SArray
        return SArray{Tuple{N...},T,length(size),prod(size)}
    end
end

Base.abs(a::AbstractVec) = error("abs(v::AbstractVec) has been removed. Use norm(v) to get the norm; abs.(v) to get the element-wise absolute value.")
