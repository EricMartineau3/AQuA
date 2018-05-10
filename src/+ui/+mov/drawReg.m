function drawReg(~,~,f,op,lbl)
    % updtFeature update network features after user draw regions
    
    fh = guidata(f);
    bd = getappdata(f,'bd');
    
    if bd.isKey(lbl)
        bd0 = bd(lbl);
    else
        bd0 = [];
    end
    
    ax = fh.mov;
    
    if strcmp(op,'add')
        tmp = [];
        hh = impoly(ax);
        if ~isempty(hh)
            tmp{1} = hh.getPosition;
            % tmp{2} = hh.createMask;
            tmp{3} = 'manual';
            bd0{end+1} = tmp;
            delete(hh)
        end
    end
    
    if strcmp(op,'arrow')
        opts = getappdata(f,'opts');
        hh = imline(ax);
        if ~isempty(hh)
            bd0 = hh.getPosition;
            opts.northx = bd0(2,1)-bd0(1,1);
            opts.northy = bd0(2,2)-bd0(1,2);
            setappdata(f,'opts',opts);
            delete(hh)
        end
    end
    
    bd(lbl) = bd0;
    setappdata(f,'bd',bd);
    f.Pointer = 'arrow';
    ui.movStep(f,[],[],1);
    
end







