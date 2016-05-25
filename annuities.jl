#!/usr/bin/julia


function get_discount_rate(int_rate)
    return (1 - ((1 + int_rate)^-1))
end

function get_discount_factor(int_rate)
    return 1 - get_discount_rate(int_rate) 
end

function a_angle_n(interest_rate, payment, N)
    output = 0
    for i = 1:N
        output = output + (payment * (1+interest_rate)^(-1 * i))
    end
    return output
end 

function a_due_angle_n(interest_rate, payment, N)
    n = N - 1
    output = 0
    for i = 0:n
        output = output + (payment * (1 + interest_rate)^(-1 * i))
    end
    return FV
end

function s_angle_n(interest_rate, payment, N)
    output = 0
    for i = 1:N
        output = output + (payment * (1 + interest_rate)^(1 * i))
    end
    return output
end

function s_due_angle_n(interest_rate, payment, N)
    output = 0
    n = N-1
    for i = 1:n
        output = output + (payment * (1 + interest_rate)^(1 * i))
    end
end


function Ia_angle_n(interest_rate, payment, incr, N)
    output = (a_due_angle_n(interest_rate,payment,N) - (N * ((1 + interest_rate)^(-1 * N))))
    output = (output / interest_rate)
    return output * incr
end

function Da_angle_n(int_rate, payment, decr, N)
    output = N - a_angle_n(int_rate, payment, N)
    return output / int_rate * decr
end

function Is_angle_n(int_rate, payment, incr, N)
    output = s_due_angle_n(int_rate, payment, N) - N
    return output / int_rate * incr
end

function Ds_angle_n(int_rate, payment, decr, N)
    output = (1 + int_rate)^N * N - s_angle_n(int_rate, payment, N)
    return output / int_rate * decr
end

function Ds_due_angle_n(int_rate, payment, decr, N)
    return (Ds_angle_n(int_rate, payment, decr, N) * int_rate / get_discount_rate(int_rate))
end

function Is_due_angle_n(int_rate, payment, incr, N)
    output = Is_angle_n(int_rate, payment, incr, N) * int_rate
    return output / get_discount_rate(int_rate)
end

function Ia_due_angle_n(int_rate, payment, incr, N)
    output = Ia_angle_n(int_rate, payment, incr, N) * int_rate
    return output / get_discount_rate(int_rate)
end

function Da_due_angle_n(int_rate, payment, decr, N)
    output = Da_angle_n(int_rate, payment, decr, N) * int_rate
    return output / get_discount_rate(int_rate)
end


