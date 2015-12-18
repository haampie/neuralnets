function rate = learningRate(student, teacher)
    rate = acos(student' * teacher / norm(student) / norm(teacher)) / pi;
end

