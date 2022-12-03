function [data,labels,count] = load_test_data(dataFile,labelFile)
%load_test_data Loads and returns NN test data
    [data, data_count] = load_file(dataFile);
    
    if nargin > 1 && nargout > 1
        [labels, label_count] = load_file(labelFile);
        
        if data_count ~= label_count
            error('Data count and label count do not match');
        end
    end
    
    if nargout > 2
        count = data_count;
    end
end

% helper function to decode whatever file format this is
function [data,count] = load_file(filename)
    fileID = fopen(filename, 'r');
    
    magic = fread(fileID, 1, 'uint16'); % two null bytes
    if magic ~= 0
        error('Invalid data file type');
    end
    type = fread(fileID, 1, 'uint8'); % datatype
    if type ~= 8
        error('Unsupported data format');
    end
    dim = fread(fileID, 1, 'uint8', 0, 'b');
    count = fread(fileID, 1, 'uint32', 0, 'b');
    size = 1;
    if dim > 1
        size = size * fread(fileID, 1, 'uint32', 0, 'b');
    end
    if dim > 2
        size = size * fread(fileID, 1, 'uint32', 0', 'b');
    end
    if dim > 3
        error('Unsupported dimension size');
    end
    
    data = fread(fileID, [size, count], 'uint8=>single');
    fclose(fileID);
end