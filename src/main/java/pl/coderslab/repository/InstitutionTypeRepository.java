package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.model.InstitutionType;

public interface InstitutionTypeRepository extends JpaRepository<InstitutionType, Long> {
}
