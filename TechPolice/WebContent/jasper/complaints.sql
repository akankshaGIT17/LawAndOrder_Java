select i.comp_text,i.comp_on,i.type,i.comp_num,i.status,k.id,k.typename,j.id,j.STATEMENTS,j.updated_on from SAKANSHA.COMPLAINTS as i,SAKANSHA.COMPLAINTS_TYPE as k,SAKANSHA.COMPLAINTS_CHECK as j where i.type=k.id or j.id=i.status