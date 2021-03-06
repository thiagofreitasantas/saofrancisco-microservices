package br.com.druid.repository;

import java.util.List;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.data.rest.core.annotation.RestResource;

import br.com.druid.domain.Customer;

@RestResource(path="customers", rel="customer")
public interface CustomerRepository extends PagingAndSortingRepository<Customer,Long>{
	List<Customer >findByName(@Param("name") String name);
}
