### Contrato Fictício: "Contrato de Aluguel de Imóvel"

**Condições e Atributos:**

1. **Locador (proprietário):** Endereço Ethereum do proprietário do imóvel.
2. **Locatário:** Endereço Ethereum do locatário (inquilino).
3. **Valor do Aluguel:** Valor mensal a ser pago pelo locatário.
4. **Data de Início:** Data de início do contrato.
5. **Duração:** Duração do contrato em meses.
6. **Depósito de Garantia:** Valor do depósito de garantia a ser pago pelo locatário.
7. **Status do Contrato:** Estado atual do contrato (Ativo, Terminado, Em atraso).
8. **Pagamentos Mensais:** Registro dos pagamentos mensais realizados pelo locatário.

**Funções principais:**

1. **Registrar Locatário:** Registrar o locatário e aceitar o depósito de garantia.
2. **Pagar Aluguel:** Permitir que o locatário pague o aluguel mensal.
3. **Encerrar Contrato:** Encerrar o contrato após o término da duração ou por acordo mútuo.
4. **Verificar Pagamentos:** Verificar se os pagamentos estão em dia.

### Explicação das Funções Principais

1. **Registrar Locatário (`registerTenant`):**
   
   * Esta função permite que o locador registre o locatário e aceite o depósito de garantia. Apenas o locador pode chamar essa função.

2. **Pagar Aluguel (`payRent`):**
   
   * Esta função permite que o locatário pague o aluguel mensal. A função verifica se o valor pago corresponde ao valor do aluguel e se o contrato está ativo.

3. **Encerrar Contrato (`terminateContract`):**
   
   * Esta função permite que o locador encerre o contrato após a duração especificada. Apenas o locador pode chamar essa função.

4. **Verificar Pagamentos (`checkPaymentStatus`):**
   
   * Esta função permite que qualquer pessoa verifique se o pagamento de um mês específico foi realizado.

5. **Verificar Pagamentos em Atraso (`checkForOverduePayments`):**
   
   * Esta função permite que o locador verifique se há pagamentos em atraso e atualize o status do contrato para "Overdue" se necessário.
