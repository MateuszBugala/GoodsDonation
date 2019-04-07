package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.model.Institution;

import java.util.List;

public interface InstitutionRepository extends JpaRepository <Institution, Long> {

    List<Institution> findAllByCityId (Long id);

    List<Institution> findFirst3ByInstitutionTypeId(Long id);

}
