function prediction = spamFilter(model, filename)

% Read and predict
file_contents = readFile(filename);
word_indices  = processEmail(file_contents);
x             = emailFeatures(word_indices);
prediction = svmPredict(model, x);

fprintf('\nProcessed %s\n\nSpam Classification: %d\n', filename, prediction);

end