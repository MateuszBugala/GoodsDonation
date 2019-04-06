package pl.coderslab.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pl.coderslab.model.InstitutionType;
import pl.coderslab.repository.InstitutionTypeRepository;

import java.util.List;

@Service
@Transactional
public class InstitutionTypeService {

    @Autowired
    private InstitutionTypeRepository institutionTypeRepository;

    public List<InstitutionType> findAll() {
        return institutionTypeRepository.findAll();
    }

    public InstitutionType findOne(Long id) {
        return institutionTypeRepository.findOne(id);
    }
}
